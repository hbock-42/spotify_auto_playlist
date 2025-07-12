// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_classification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongClassification _$SongClassificationFromJson(Map<String, dynamic> json) =>
    _SongClassification(
      trackId: json['trackId'] as String,
      trackName: json['trackName'] as String,
      artistName: json['artistName'] as String,
      moods: (json['moods'] as List<dynamic>).map((e) => e as String).toList(),
      contexts: (json['contexts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      styles: (json['styles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      confidence: (json['confidence'] as num).toDouble(),
      analyzedAt: DateTime.parse(json['analyzedAt'] as String),
      metadata: ClassificationMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SongClassificationToJson(_SongClassification instance) =>
    <String, dynamic>{
      'trackId': instance.trackId,
      'trackName': instance.trackName,
      'artistName': instance.artistName,
      'moods': instance.moods,
      'contexts': instance.contexts,
      'styles': instance.styles,
      'confidence': instance.confidence,
      'analyzedAt': instance.analyzedAt.toIso8601String(),
      'metadata': instance.metadata.toJson(),
    };

_ClassificationMetadata _$ClassificationMetadataFromJson(
  Map<String, dynamic> json,
) => _ClassificationMetadata(
  modelUsed: json['modelUsed'] as String,
  promptVersion: json['promptVersion'] as String,
  processingTime: Duration(
    microseconds: (json['processingTime'] as num).toInt(),
  ),
  audioFeatures: json['audioFeatures'] as Map<String, dynamic>,
  confidenceScore: (json['confidenceScore'] as num).toDouble(),
);

Map<String, dynamic> _$ClassificationMetadataToJson(
  _ClassificationMetadata instance,
) => <String, dynamic>{
  'modelUsed': instance.modelUsed,
  'promptVersion': instance.promptVersion,
  'processingTime': instance.processingTime.inMicroseconds,
  'audioFeatures': instance.audioFeatures,
  'confidenceScore': instance.confidenceScore,
};
