// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpotifyTrack _$SpotifyTrackFromJson(Map<String, dynamic> json) =>
    _SpotifyTrack(
      id: json['id'] as String,
      name: json['name'] as String,
      artists: (json['artists'] as List<dynamic>)
          .map((e) => SpotifyArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      album: SpotifyAlbum.fromJson(json['album'] as Map<String, dynamic>),
      durationMs: (json['durationMs'] as num).toInt(),
      uri: json['uri'] as String,
      href: json['href'] as String,
      previewUrl: json['previewUrl'] as String?,
      isLocal: json['isLocal'] as bool,
      popularity: (json['popularity'] as num).toInt(),
      explicit: json['explicit'] as bool,
    );

Map<String, dynamic> _$SpotifyTrackToJson(_SpotifyTrack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artists': instance.artists,
      'album': instance.album,
      'durationMs': instance.durationMs,
      'uri': instance.uri,
      'href': instance.href,
      'previewUrl': instance.previewUrl,
      'isLocal': instance.isLocal,
      'popularity': instance.popularity,
      'explicit': instance.explicit,
    };

_SpotifyArtist _$SpotifyArtistFromJson(Map<String, dynamic> json) =>
    _SpotifyArtist(
      id: json['id'] as String,
      name: json['name'] as String,
      uri: json['uri'] as String,
      href: json['href'] as String,
    );

Map<String, dynamic> _$SpotifyArtistToJson(_SpotifyArtist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uri': instance.uri,
      'href': instance.href,
    };

_SpotifyAlbum _$SpotifyAlbumFromJson(Map<String, dynamic> json) =>
    _SpotifyAlbum(
      id: json['id'] as String,
      name: json['name'] as String,
      albumType: json['albumType'] as String,
      releaseDate: json['releaseDate'] as String,
      totalTracks: (json['totalTracks'] as num).toInt(),
      uri: json['uri'] as String,
      href: json['href'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => SpotifyImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifyAlbumToJson(_SpotifyAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'albumType': instance.albumType,
      'releaseDate': instance.releaseDate,
      'totalTracks': instance.totalTracks,
      'uri': instance.uri,
      'href': instance.href,
      'images': instance.images,
    };

_SpotifyImage _$SpotifyImageFromJson(Map<String, dynamic> json) =>
    _SpotifyImage(
      url: json['url'] as String,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpotifyImageToJson(_SpotifyImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
    };
