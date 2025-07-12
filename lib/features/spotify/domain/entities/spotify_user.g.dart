// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpotifyUser _$SpotifyUserFromJson(Map<String, dynamic> json) => _SpotifyUser(
  id: json['id'] as String,
  displayName: json['display_name'] as String?,
  email: json['email'] as String?,
  followers: json['followers'] == null
      ? null
      : SpotifyFollowers.fromJson(json['followers'] as Map<String, dynamic>),
  country: json['country'] as String?,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => SpotifyImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  href: json['href'] as String,
  uri: json['uri'] as String,
  externalUrls: (json['external_urls'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$SpotifyUserToJson(_SpotifyUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'email': instance.email,
      'followers': instance.followers,
      'country': instance.country,
      'images': instance.images,
      'href': instance.href,
      'uri': instance.uri,
      'external_urls': instance.externalUrls,
    };

_SpotifyFollowers _$SpotifyFollowersFromJson(Map<String, dynamic> json) =>
    _SpotifyFollowers(
      href: json['href'] as String?,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$SpotifyFollowersToJson(_SpotifyFollowers instance) =>
    <String, dynamic>{'href': instance.href, 'total': instance.total};
