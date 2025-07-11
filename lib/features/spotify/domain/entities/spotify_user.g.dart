// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpotifyUser _$SpotifyUserFromJson(Map<String, dynamic> json) => _SpotifyUser(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  email: json['email'] as String?,
  followers: (json['followers'] as num?)?.toInt(),
  country: json['country'] as String?,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$SpotifyUserToJson(_SpotifyUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'followers': instance.followers,
      'country': instance.country,
      'imageUrl': instance.imageUrl,
    };
