import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_loader.freezed.dart';
part 'config_loader.g.dart';

@freezed
abstract class AppConfig with _$AppConfig {
  const factory AppConfig({
    required AppInfo app,
    required SpotifyConfig spotify,
    required ApiConfig api,
    required FeaturesConfig features,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
}

@freezed
abstract class AppInfo with _$AppInfo {
  const factory AppInfo({
    required String name,
    required String version,
    required String environment,
  }) = _AppInfo;

  factory AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);
}

@freezed
abstract class SpotifyConfig with _$SpotifyConfig {
  const factory SpotifyConfig({
    required String clientId,
    required String redirectUri,
    String? redirectUriWeb,
    required List<String> scopes,
  }) = _SpotifyConfig;

  factory SpotifyConfig.fromJson(Map<String, dynamic> json) => _$SpotifyConfigFromJson(json);
}

@freezed
abstract class ApiConfig with _$ApiConfig {
  const factory ApiConfig({
    required String baseUrl,
    required String tokenUrl,
    required String authorizeUrl,
  }) = _ApiConfig;

  factory ApiConfig.fromJson(Map<String, dynamic> json) => _$ApiConfigFromJson(json);
}

@freezed
abstract class FeaturesConfig with _$FeaturesConfig {
  const factory FeaturesConfig({
    required bool enableLogging,
    required int maxPlaylistAnalysis,
    required String defaultPlaylistPrefix,
  }) = _FeaturesConfig;

  factory FeaturesConfig.fromJson(Map<String, dynamic> json) => _$FeaturesConfigFromJson(json);
}

class ConfigLoader {
  static Future<Either<String, AppConfig>> loadConfig({
    required String configFile,
  }) async {
    try {
      final String configString = await rootBundle.loadString(configFile);
      final Map<String, dynamic> configJson = json.decode(configString);

      final config = AppConfig.fromJson(configJson);

      // Validate URLs
      final urlValidation = _validateUrls(config.api);
      if (urlValidation != null) {
        return left(urlValidation);
      }

      // Validate scopes
      if (config.spotify.scopes.isEmpty) {
        return left('Spotify scopes cannot be empty');
      }

      // Validate max playlist analysis
      if (config.features.maxPlaylistAnalysis <= 0) {
        return left('Max playlist analysis must be greater than 0');
      }

      return right(config);
    } catch (e) {
      return left('Failed to load configuration: $e');
    }
  }

  static String? _validateUrls(ApiConfig api) {
    final urls = [
      ('baseUrl', api.baseUrl),
      ('tokenUrl', api.tokenUrl),
      ('authorizeUrl', api.authorizeUrl),
    ];

    for (final (name, url) in urls) {
      final uri = Uri.tryParse(url);
      if (uri == null || !uri.isAbsolute) {
        return 'API $name must be a valid absolute URL';
      }
    }
    return null;
  }
}
