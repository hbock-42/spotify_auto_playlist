import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

import '../../../../core/utils/log_formatters.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../domain/failures/spotify_failure.dart';

class SpotifyApiClient {
  SpotifyApiClient({
    required Dio dio,
    required AuthRepository authRepository,
    required Logger logger,
  }) : _dio = dio,
       _authRepository = authRepository,
       _logger = logger {
    _setupInterceptors();
  }
  static const String _baseUrl = 'https://api.spotify.com/v1';

  final Dio _dio;
  final AuthRepository _authRepository;
  final Logger _logger;

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onError: _onError,
      ),
    );

    // Add beautiful logging interceptor
    const lineLength = 120;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final buffer = StringBuffer();
          buffer.writeln('🎵 ${options.method.toUpperCase()} ${options.path}');

          if (options.queryParameters.isNotEmpty) {
            final queryStr = options.queryParameters.entries
                .map((e) => '${e.key}=${e.value}')
                .join('&');
            formatLongString(buffer, queryStr, '   Query: ', '          ', lineLength);
          }

          _logger.i(buffer.toString().trim());
          handler.next(options);
        },
        onResponse: (response, handler) {
          final buffer = StringBuffer();
          buffer.writeln('✅ ${response.statusCode} ${response.requestOptions.path}');

          // Format response data nicely
          if (response.data != null) {
            final dataStr = response.data.toString();
            const indent = '   Response: ';
            const continueIndent = '             ';

            if (dataStr.length > 1000) {
              final truncatedStr = '${dataStr.substring(0, 1000)}...';
              formatLongString(buffer, truncatedStr, indent, continueIndent, lineLength);
            } else {
              formatLongString(buffer, dataStr, indent, continueIndent, lineLength);
            }
          }

          _logger.i(buffer.toString().trim());
          handler.next(response);
        },
        onError: (error, handler) {
          final buffer = StringBuffer();
          buffer.writeln(
            '❌ ${error.response?.statusCode ?? 'NETWORK'} ${error.requestOptions.path}',
          );

          if (error.message != null) {
            formatLongString(buffer, error.message!, '   Error: ', '          ', lineLength);
          }

          if (error.response?.data != null) {
            final responseStr = error.response!.data.toString();
            formatLongString(buffer, responseStr, '   Response: ', '             ', lineLength);
          }

          _logger.e(buffer.toString().trim());
          handler.next(error);
        },
      ),
    );
  }

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add authorization header
    final authResult = await _authRepository.getCurrentTokens();

    authResult.fold(
      (failure) {
        _logger.e('Failed to get auth tokens: $failure');
        handler.reject(
          DioException(
            requestOptions: options,
            error: 'Authentication required',
            type: DioExceptionType.cancel,
          ),
        );
      },
      (tokens) {
        options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
        handler.next(options);
      },
    );
  }

  Future<void> _onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Try to refresh token - get current tokens which will trigger refresh if needed
      final refreshResult = await _authRepository.getCurrentTokens();

      await refreshResult.fold(
        (failure) async {
          _logger.e('Token refresh failed: $failure');
          handler.next(err);
        },
        (tokens) async {
          // Retry the original request with new token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';

          try {
            final response = await _dio.fetch(options);
            handler.resolve(response);
          } catch (e) {
            handler.next(err);
          }
        },
      );
    } else {
      handler.next(err);
    }
  }

  Future<Either<SpotifyFailure, T>> _handleRequest<T>(
    Future<Response> Function() request,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await request();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(fromJson(response.data));
      } else {
        return Left(_mapStatusCodeToFailure(response.statusCode));
      }
    } on DioException catch (e) {
      return Left(_mapDioExceptionToFailure(e));
    } catch (e) {
      _logger.e('Unexpected error: $e');
      return Left(SpotifyFailure.unknown(e.toString()));
    }
  }

  Future<Either<SpotifyFailure, List<T>>> _handleListRequest<T>(
    Future<Response> Function() request,
    T Function(Map<String, dynamic>) fromJson,
    String itemsKey,
  ) async {
    try {
      final response = await request();

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final items = data[itemsKey] as List<dynamic>;
        final results = items.cast<Map<String, dynamic>>().map(fromJson).toList();

        return Right(results);
      } else {
        return Left(_mapStatusCodeToFailure(response.statusCode));
      }
    } on DioException catch (e) {
      return Left(_mapDioExceptionToFailure(e));
    } catch (e) {
      _logger.e('Unexpected error: $e');
      return Left(SpotifyFailure.unknown(e.toString()));
    }
  }

  SpotifyFailure _mapStatusCodeToFailure(int? statusCode) {
    switch (statusCode) {
      case 401:
        return const SpotifyFailure.unauthorized();
      case 403:
        return const SpotifyFailure.forbidden();
      case 404:
        return const SpotifyFailure.notFound();
      case 429:
        return const SpotifyFailure.rateLimited();
      case 500:
      case 502:
      case 503:
        return SpotifyFailure.serverError('Server error: $statusCode');
      default:
        return SpotifyFailure.unknown('HTTP error: $statusCode');
    }
  }

  SpotifyFailure _mapDioExceptionToFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return SpotifyFailure.networkError('Request timeout: ${e.message}');
      case DioExceptionType.connectionError:
        return SpotifyFailure.networkError('Connection error: ${e.message}');
      case DioExceptionType.badResponse:
        return _mapStatusCodeToFailure(e.response?.statusCode);
      case DioExceptionType.cancel:
        return SpotifyFailure.networkError('Request cancelled');
      case DioExceptionType.unknown:
        return SpotifyFailure.unknown('Unknown error: ${e.message}');
      case DioExceptionType.badCertificate:
        return SpotifyFailure.networkError('Certificate error: ${e.message}');
    }
  }

  // API Methods
  Future<Either<SpotifyFailure, Map<String, dynamic>>> getCurrentUser() {
    return _handleRequest(
      () => _dio.get('$_baseUrl/me'),
      (data) => data,
    );
  }

  Future<Either<SpotifyFailure, Map<String, dynamic>>> getUserPlaylists({
    int limit = 20,
    int offset = 0,
  }) {
    return _handleRequest(
      () => _dio.get(
        '$_baseUrl/me/playlists',
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      ),
      (data) => data,
    );
  }

  Future<Either<SpotifyFailure, Map<String, dynamic>>> getPlaylist(String playlistId) {
    return _handleRequest(
      () => _dio.get('$_baseUrl/playlists/$playlistId'),
      (data) => data,
    );
  }

  Future<Either<SpotifyFailure, Map<String, dynamic>>> getPlaylistTracks(
    String playlistId, {
    int limit = 50,
    int offset = 0,
  }) {
    return _handleRequest(
      () => _dio.get(
        '$_baseUrl/playlists/$playlistId/tracks',
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      ),
      (data) => data,
    );
  }

  Future<Either<SpotifyFailure, Map<String, dynamic>>> createPlaylist({
    required String userId,
    required String name,
    String? description,
    bool public = false,
  }) {
    return _handleRequest(
      () => _dio.post(
        '$_baseUrl/users/$userId/playlists',
        data: {
          'name': name,
          'description': description,
          'public': public,
        },
      ),
      (data) => data,
    );
  }

  Future<Either<SpotifyFailure, void>> addTracksToPlaylist(
    String playlistId,
    List<String> trackUris,
  ) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/playlists/$playlistId/tracks',
        data: {'uris': trackUris},
      );

      if (response.statusCode == 201) {
        return const Right(null);
      } else {
        return Left(_mapStatusCodeToFailure(response.statusCode));
      }
    } on DioException catch (e) {
      return Left(_mapDioExceptionToFailure(e));
    } catch (e) {
      _logger.e('Unexpected error: $e');
      return Left(SpotifyFailure.unknown(e.toString()));
    }
  }

  Future<Either<SpotifyFailure, Map<String, dynamic>>> getAudioFeatures(List<String> trackIds) {
    return _handleRequest(
      () => _dio.get(
        '$_baseUrl/audio-features',
        queryParameters: {
          'ids': trackIds.join(','),
        },
      ),
      (data) => data,
    );
  }
}
