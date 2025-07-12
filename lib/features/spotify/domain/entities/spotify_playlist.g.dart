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
      public: json['public'] as bool?,
      collaborative: json['collaborative'] as bool,
      uri: json['uri'] as String,
      href: json['href'] as String,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => SpotifyImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      snapshotId: json['snapshot_id'] as String?,
      tracks: SpotifyTracksRef.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpotifyPlaylistToJson(_SpotifyPlaylist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'owner': instance.owner,
      'public': instance.public,
      'collaborative': instance.collaborative,
      'uri': instance.uri,
      'href': instance.href,
      'images': instance.images,
      'snapshot_id': instance.snapshotId,
      'tracks': instance.tracks,
    };

_SpotifyTracksRef _$SpotifyTracksRefFromJson(Map<String, dynamic> json) =>
    _SpotifyTracksRef(
      href: json['href'] as String,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$SpotifyTracksRefToJson(_SpotifyTracksRef instance) =>
    <String, dynamic>{'href': instance.href, 'total': instance.total};
