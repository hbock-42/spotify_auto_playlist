// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongAnalysis _$SongAnalysisFromJson(Map<String, dynamic> json) =>
    _SongAnalysis(
      trackId: json['trackId'] as String,
      moods: (json['moods'] as List<dynamic>).map((e) => e as String).toList(),
      contexts: (json['contexts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      styles: (json['styles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      confidence: (json['confidence'] as num).toDouble(),
      analyzedAt: DateTime.parse(json['analyzedAt'] as String),
    );

Map<String, dynamic> _$SongAnalysisToJson(_SongAnalysis instance) =>
    <String, dynamic>{
      'trackId': instance.trackId,
      'moods': instance.moods,
      'contexts': instance.contexts,
      'styles': instance.styles,
      'confidence': instance.confidence,
      'analyzedAt': instance.analyzedAt.toIso8601String(),
    };

_SongMetadata _$SongMetadataFromJson(Map<String, dynamic> json) =>
    _SongMetadata(
      title: json['title'] as String,
      artist: json['artist'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      energy: (json['energy'] as num).toDouble(),
      danceability: (json['danceability'] as num).toDouble(),
      valence: (json['valence'] as num).toDouble(),
      tempo: (json['tempo'] as num).toDouble(),
      acousticness: (json['acousticness'] as num).toDouble(),
    );

Map<String, dynamic> _$SongMetadataToJson(_SongMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'genres': instance.genres,
      'energy': instance.energy,
      'danceability': instance.danceability,
      'valence': instance.valence,
      'tempo': instance.tempo,
      'acousticness': instance.acousticness,
    };
