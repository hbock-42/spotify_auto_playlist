// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Playlist _$PlaylistFromJson(Map<String, dynamic> json) => _Playlist(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  ownerId: json['ownerId'] as String,
  ownerDisplayName: json['ownerDisplayName'] as String,
  isPublic: json['isPublic'] as bool?,
  isCollaborative: json['isCollaborative'] as bool,
  totalTracks: (json['totalTracks'] as num?)?.toInt(),
  tracks: (json['tracks'] as List<dynamic>)
      .map((e) => Track.fromJson(e as Map<String, dynamic>))
      .toList(),
  imageUrl: json['imageUrl'] as String?,
  externalUrl: json['externalUrl'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  modifiedAt: json['modifiedAt'] == null
      ? null
      : DateTime.parse(json['modifiedAt'] as String),
);

Map<String, dynamic> _$PlaylistToJson(_Playlist instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'ownerId': instance.ownerId,
  'ownerDisplayName': instance.ownerDisplayName,
  'isPublic': instance.isPublic,
  'isCollaborative': instance.isCollaborative,
  'totalTracks': instance.totalTracks,
  'tracks': instance.tracks,
  'imageUrl': instance.imageUrl,
  'externalUrl': instance.externalUrl,
  'createdAt': instance.createdAt.toIso8601String(),
  'modifiedAt': instance.modifiedAt?.toIso8601String(),
};

_Track _$TrackFromJson(Map<String, dynamic> json) => _Track(
  id: json['id'] as String,
  name: json['name'] as String,
  artistName: json['artistName'] as String,
  albumName: json['albumName'] as String,
  durationMs: (json['durationMs'] as num).toInt(),
  previewUrl: json['previewUrl'] as String?,
  externalUrl: json['externalUrl'] as String,
  imageUrl: json['imageUrl'] as String?,
  isExplicit: json['isExplicit'] as bool,
  popularity: (json['popularity'] as num).toInt(),
  addedAt: DateTime.parse(json['addedAt'] as String),
  audioFeatures: json['audioFeatures'] == null
      ? null
      : AudioFeatures.fromJson(json['audioFeatures'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TrackToJson(_Track instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'artistName': instance.artistName,
  'albumName': instance.albumName,
  'durationMs': instance.durationMs,
  'previewUrl': instance.previewUrl,
  'externalUrl': instance.externalUrl,
  'imageUrl': instance.imageUrl,
  'isExplicit': instance.isExplicit,
  'popularity': instance.popularity,
  'addedAt': instance.addedAt.toIso8601String(),
  'audioFeatures': instance.audioFeatures,
};

_AudioFeatures _$AudioFeaturesFromJson(Map<String, dynamic> json) =>
    _AudioFeatures(
      id: json['id'] as String,
      acousticness: (json['acousticness'] as num).toDouble(),
      danceability: (json['danceability'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
      instrumentalness: (json['instrumentalness'] as num).toDouble(),
      key: (json['key'] as num).toInt(),
      liveness: (json['liveness'] as num).toDouble(),
      loudness: (json['loudness'] as num).toDouble(),
      mode: (json['mode'] as num).toInt(),
      speechiness: (json['speechiness'] as num).toDouble(),
      tempo: (json['tempo'] as num).toDouble(),
      timeSignature: (json['timeSignature'] as num).toInt(),
      valence: (json['valence'] as num).toDouble(),
    );

Map<String, dynamic> _$AudioFeaturesToJson(_AudioFeatures instance) =>
    <String, dynamic>{
      'id': instance.id,
      'acousticness': instance.acousticness,
      'danceability': instance.danceability,
      'energy': instance.energy,
      'instrumentalness': instance.instrumentalness,
      'key': instance.key,
      'liveness': instance.liveness,
      'loudness': instance.loudness,
      'mode': instance.mode,
      'speechiness': instance.speechiness,
      'tempo': instance.tempo,
      'timeSignature': instance.timeSignature,
      'valence': instance.valence,
    };
