import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_exception.dart';
import 'package:oauth2_client/oauth2_helper.dart';

import '../../../core/config/config_loader.dart';
import '../domain/entities/auth_tokens.dart';
import '../domain/failures/auth_failure.dart';
import '../domain/repositories/auth_repository.dart';
import 'spotify_oauth2_client.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required FlutterSecureStorage secureStorage,
    required Logger logger,
    required AppConfig config,
    required SpotifyOAuth2Client spotifyClient,
  }) : _secureStorage = secureStorage,
       _logger = logger,
       _config = config,
       _oAuth2Helper = OAuth2Helper(
         spotifyClient,
         clientId: config.spotify.clientId,
         scopes: config.spotify.scopes,
         enablePKCE: true,
         enableState: true,
       );

  final FlutterSecureStorage _secureStorage;
  final Logger _logger;
  final AppConfig _config;
  late final OAuth2Helper _oAuth2Helper;

  static const String _tokenStorageKey = 'spotify_auth_tokens';

  @override
  Future<Either<AuthFailure, AuthTokens>> authenticate() async {
    try {
      _logger.i('Starting Spotify authentication');

      final response = await _oAuth2Helper.getToken();

      if (response == null) {
        _logger.w('Authentication cancelled by user');
        return left(const AuthFailure.userCancelled());
      }

      final tokens = _mapResponseToTokens(response);

      // Store tokens securely
      await storeTokens(tokens);

      _logger.i('Authentication successful');
      return right(tokens);
    } on OAuth2Exception catch (e) {
      _logger.e('OAuth2 error during authentication', error: e);
      return left(AuthFailure.authorizationFailed(e.toString()));
    } catch (e, stack) {
      _logger.e('Unexpected error during authentication', error: e, stackTrace: stack);
      return left(AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, AuthTokens>> refreshTokens(String refreshToken) async {
    try {
      _logger.i('Refreshing tokens');

      // OAuth2Helper handles token refresh internally
      // We just need to get the current token which will trigger refresh if needed
      final response = await _oAuth2Helper.getToken();

      if (response == null) {
        _logger.w('Token refresh failed - no response');
        return left(const AuthFailure.tokenRefreshFailed('No response from refresh'));
      }

      final tokens = _mapResponseToTokens(response);

      // Store updated tokens
      await storeTokens(tokens);

      _logger.i('Token refresh successful');
      return right(tokens);
    } on OAuth2Exception catch (e) {
      _logger.e('OAuth2 error during token refresh', error: e);
      return left(AuthFailure.tokenRefreshFailed(e.toString()));
    } catch (e, stack) {
      _logger.e('Unexpected error during token refresh', error: e, stackTrace: stack);
      return left(AuthFailure.tokenRefreshFailed(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, AuthTokens?>> getStoredTokens() async {
    try {
      _logger.d('Retrieving stored tokens');

      final tokensJson = await _secureStorage.read(key: _tokenStorageKey);

      if (tokensJson == null) {
        _logger.d('No stored tokens found');
        return right(null);
      }

      final tokens = AuthTokens.fromJson(json.decode(tokensJson));

      _logger.d('Stored tokens retrieved successfully');
      return right(tokens);
    } catch (e, stack) {
      _logger.e('Error retrieving stored tokens', error: e, stackTrace: stack);
      return left(AuthFailure.storageError(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, AuthTokens>> getCurrentTokens() async {
    final storedResult = await getStoredTokens();
    
    return storedResult.fold(
      (failure) => left(failure),
      (tokens) {
        if (tokens == null) {
          return left(const AuthFailure.tokenExpired());
        }
        
        // If tokens are expired, try to refresh them
        if (tokens.isExpired && tokens.canRefresh) {
          return refreshTokens(tokens.refreshToken!);
        }
        
        return right(tokens);
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> clearTokens() async {
    try {
      _logger.i('Clearing stored tokens');

      await _secureStorage.delete(key: _tokenStorageKey);

      _logger.i('Tokens cleared successfully');
      return right(unit);
    } catch (e, stack) {
      _logger.e('Error clearing tokens', error: e, stackTrace: stack);
      return left(AuthFailure.storageError(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> storeTokens(AuthTokens tokens) async {
    try {
      _logger.d('Storing tokens');

      final tokensJson = json.encode(tokens.toJson());
      await _secureStorage.write(key: _tokenStorageKey, value: tokensJson);

      _logger.d('Tokens stored successfully');
      return right(unit);
    } catch (e, stack) {
      _logger.e('Error storing tokens', error: e, stackTrace: stack);
      return left(AuthFailure.storageError(e.toString()));
    }
  }

  AuthTokens _mapResponseToTokens(AccessTokenResponse response) {
    return AuthTokens(
      accessToken: response.accessToken!,
      refreshToken: response.refreshToken,
      expiresAt: response.expirationDate,
      scopes: _config.spotify.scopes,
    );
  }
}
