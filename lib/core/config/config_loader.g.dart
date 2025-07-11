// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_loader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  app: AppInfo.fromJson(json['app'] as Map<String, dynamic>),
  spotify: SpotifyConfig.fromJson(json['spotify'] as Map<String, dynamic>),
  api: ApiConfig.fromJson(json['api'] as Map<String, dynamic>),
  features: FeaturesConfig.fromJson(json['features'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'app': instance.app,
      'spotify': instance.spotify,
      'api': instance.api,
      'features': instance.features,
    };

_AppInfo _$AppInfoFromJson(Map<String, dynamic> json) => _AppInfo(
  name: json['name'] as String,
  version: json['version'] as String,
  environment: json['environment'] as String,
);

Map<String, dynamic> _$AppInfoToJson(_AppInfo instance) => <String, dynamic>{
  'name': instance.name,
  'version': instance.version,
  'environment': instance.environment,
};

_SpotifyConfig _$SpotifyConfigFromJson(Map<String, dynamic> json) =>
    _SpotifyConfig(
      clientId: json['clientId'] as String,
      redirectUri: json['redirectUri'] as String,
      redirectUriWeb: json['redirectUriWeb'] as String?,
      scopes: (json['scopes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SpotifyConfigToJson(_SpotifyConfig instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'redirectUri': instance.redirectUri,
      'redirectUriWeb': instance.redirectUriWeb,
      'scopes': instance.scopes,
    };

_ApiConfig _$ApiConfigFromJson(Map<String, dynamic> json) => _ApiConfig(
  baseUrl: json['baseUrl'] as String,
  tokenUrl: json['tokenUrl'] as String,
  authorizeUrl: json['authorizeUrl'] as String,
);

Map<String, dynamic> _$ApiConfigToJson(_ApiConfig instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'tokenUrl': instance.tokenUrl,
      'authorizeUrl': instance.authorizeUrl,
    };

_FeaturesConfig _$FeaturesConfigFromJson(Map<String, dynamic> json) =>
    _FeaturesConfig(
      enableLogging: json['enableLogging'] as bool,
      maxPlaylistAnalysis: (json['maxPlaylistAnalysis'] as num).toInt(),
      defaultPlaylistPrefix: json['defaultPlaylistPrefix'] as String,
    );

Map<String, dynamic> _$FeaturesConfigToJson(_FeaturesConfig instance) =>
    <String, dynamic>{
      'enableLogging': instance.enableLogging,
      'maxPlaylistAnalysis': instance.maxPlaylistAnalysis,
      'defaultPlaylistPrefix': instance.defaultPlaylistPrefix,
    };
