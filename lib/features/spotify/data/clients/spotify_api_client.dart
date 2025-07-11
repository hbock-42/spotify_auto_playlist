import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../domain/failures/spotify_failure.dart';

class SpotifyApiClient {
  static const String _baseUrl = 'https://api.spotify.com/v1';
  
  final Dio _dio;
  final AuthRepository _authRepository;
  final Logger _logger;

  SpotifyApiClient({
    required Dio dio,
    required AuthRepository authRepository,
    required Logger logger,
  })  : _dio = dio,
        _authRepository = authRepository,
        _logger = logger {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onError: _onError,
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
        final results = items
            .cast<Map<String, dynamic>>()
            .map(fromJson)
            .toList();
        
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
}