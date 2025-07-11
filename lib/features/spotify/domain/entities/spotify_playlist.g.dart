// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpotifyPlaylist _$SpotifyPlaylistFromJson(Map<String, dynamic> json) =>
    _SpotifyPlaylist(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      owner: SpotifyUser.fromJson(json['owner'] as Map<String, dynamic>),
      public: json['public'] as bool,
      collaborative: json['collaborative'] as bool,
      totalTracks: (json['totalTracks'] as num).toInt(),
      uri: json['uri'] as String,
      href: json['href'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => SpotifyImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      snapshotId: json['snapshotId'] as String?,
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => SpotifyTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifyPlaylistToJson(_SpotifyPlaylist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'owner': instance.owner,
      'public': instance.public,
      'collaborative': instance.collaborative,
      'totalTracks': instance.totalTracks,
      'uri': instance.uri,
      'href': instance.href,
      'images': instance.images,
      'snapshotId': instance.snapshotId,
      'tracks': instance.tracks,
    };
