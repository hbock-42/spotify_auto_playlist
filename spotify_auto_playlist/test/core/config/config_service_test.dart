import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spotify_auto_playlist/core/config/config_loader.dart';

void main() {
  group('AppConfig', () {
    group('fromJson', () {
      test('should create valid AppConfig when all fields are correct', () {
        // Arrange
        final validConfig = {
          'app': {
            'name': 'Test App',
            'version': '1.0.0',
            'environment': 'test',
          },
          'spotify': {
            'clientId': 'test_client_id',
            'redirectUri': 'http://localhost:8080/callback',
            'scopes': ['playlist-read-private', 'playlist-modify-public'],
          },
          'api': {
            'baseUrl': 'https://api.spotify.com/v1',
            'tokenUrl': 'https://accounts.spotify.com/api/token',
            'authorizeUrl': 'https://accounts.spotify.com/authorize',
          },
          'features': {
            'enableLogging': true,
            'maxPlaylistAnalysis': 10,
            'defaultPlaylistPrefix': 'auto',
          },
        };

        // Act
        final config = AppConfig.fromJson(validConfig);

        // Assert
        expect(config.app.name, 'Test App');
        expect(config.app.version, '1.0.0');
        expect(config.app.environment, 'test');
        expect(config.spotify.redirectUri, 'http://localhost:8080/callback');
        expect(config.spotify.scopes, ['playlist-read-private', 'playlist-modify-public']);
        expect(config.api.baseUrl, 'https://api.spotify.com/v1');
        expect(config.api.tokenUrl, 'https://accounts.spotify.com/api/token');
        expect(config.api.authorizeUrl, 'https://accounts.spotify.com/authorize');
        expect(config.features.enableLogging, true);
        expect(config.features.maxPlaylistAnalysis, 10);
        expect(config.features.defaultPlaylistPrefix, 'auto');
      });

      test('should throw exception when app section is missing', () {
        // Arrange
        final invalidConfig = {
          'spotify': {
            'clientId': 'test_client_id',
            'redirectUri': 'http://localhost:8080/callback',
            'scopes': ['playlist-read-private'],
          },
          'api': {
            'baseUrl': 'https://api.spotify.com/v1',
            'tokenUrl': 'https://accounts.spotify.com/api/token',
            'authorizeUrl': 'https://accounts.spotify.com/authorize',
          },
          'features': {
            'enableLogging': true,
            'maxPlaylistAnalysis': 10,
            'defaultPlaylistPrefix': 'auto',
          },
        };

        // Act & Assert
        expect(
          () => AppConfig.fromJson(invalidConfig),
          throwsA(isA<TypeError>()),
        );
      });

      test('should throw exception when required fields are missing', () {
        // Arrange
        final invalidConfig = {
          'app': {
            'version': '1.0.0',
            'environment': 'test',
          },
          'spotify': {
            'clientId': 'test_client_id',
            'redirectUri': 'http://localhost:8080/callback',
            'scopes': ['playlist-read-private'],
          },
          'api': {
            'baseUrl': 'https://api.spotify.com/v1',
            'tokenUrl': 'https://accounts.spotify.com/api/token',
            'authorizeUrl': 'https://accounts.spotify.com/authorize',
          },
          'features': {
            'enableLogging': true,
            'maxPlaylistAnalysis': 10,
            'defaultPlaylistPrefix': 'auto',
          },
        };

        // Act & Assert
        expect(
          () => AppConfig.fromJson(invalidConfig),
          throwsA(isA<TypeError>()),
        );
      });
    });

    group('copyWith', () {
      test('should create new instance with updated values', () {
        // Arrange
        final original = AppConfig(
          app: AppInfo(name: 'Test App', version: '1.0.0', environment: 'test'),
          spotify: SpotifyConfig(
            clientId: 'test_client_id',
            redirectUri: 'http://localhost:8080/callback',
            scopes: ['playlist-read-private'],
          ),
          api: ApiConfig(
            baseUrl: 'https://api.spotify.com/v1',
            tokenUrl: 'https://accounts.spotify.com/api/token',
            authorizeUrl: 'https://accounts.spotify.com/authorize',
          ),
          features: FeaturesConfig(
            enableLogging: true,
            maxPlaylistAnalysis: 10,
            defaultPlaylistPrefix: 'auto',
          ),
        );

        // Act
        final updated = original.copyWith(
          app: original.app.copyWith(name: 'Updated App'),
        );

        // Assert
        expect(updated.app.name, 'Updated App');
        expect(updated.app.version, '1.0.0'); // unchanged
        expect(original.app.name, 'Test App'); // original unchanged
      });
    });

    group('equality', () {
      test('should be equal when all fields match', () {
        // Arrange
        final config1 = AppConfig(
          app: AppInfo(name: 'Test App', version: '1.0.0', environment: 'test'),
          spotify: SpotifyConfig(
            clientId: 'test_client_id',
            redirectUri: 'http://localhost:8080/callback',
            scopes: ['playlist-read-private'],
          ),
          api: ApiConfig(
            baseUrl: 'https://api.spotify.com/v1',
            tokenUrl: 'https://accounts.spotify.com/api/token',
            authorizeUrl: 'https://accounts.spotify.com/authorize',
          ),
          features: FeaturesConfig(
            enableLogging: true,
            maxPlaylistAnalysis: 10,
            defaultPlaylistPrefix: 'auto',
          ),
        );

        final config2 = AppConfig(
          app: AppInfo(name: 'Test App', version: '1.0.0', environment: 'test'),
          spotify: SpotifyConfig(
            clientId: 'test_client_id',
            redirectUri: 'http://localhost:8080/callback',
            scopes: ['playlist-read-private'],
          ),
          api: ApiConfig(
            baseUrl: 'https://api.spotify.com/v1',
            tokenUrl: 'https://accounts.spotify.com/api/token',
            authorizeUrl: 'https://accounts.spotify.com/authorize',
          ),
          features: FeaturesConfig(
            enableLogging: true,
            maxPlaylistAnalysis: 10,
            defaultPlaylistPrefix: 'auto',
          ),
        );

        // Assert
        expect(config1, equals(config2));
        expect(config1.hashCode, equals(config2.hashCode));
      });
    });
  });

  group('ConfigLoader', () {
    group('loadConfig', () {
      test('should return error when config file does not exist', () async {
        // Act
        final result = await ConfigLoader.loadConfig(
          configFile: 'assets/config/non-existent.json',
        );

        // Assert
        expect(result, isA<Left>());
        result.fold(
          (error) => expect(error, contains('Failed to load configuration')),
          (config) => fail('Expected error but got success'),
        );
      });

      // Note: File loading tests with valid config are not included because they require
      // Flutter widget testing environment to access assets.
      // The validation logic is thoroughly tested above through AppConfig tests.
    });
  });
}
