import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_classification.freezed.dart';
part 'song_classification.g.dart';

@freezed
abstract class SongClassification with _$SongClassification {
  const factory SongClassification({
    required String trackId,
    required String trackName,
    required String artistName,
    required List<String> moods,
    required List<String> contexts,
    required List<String> styles,
    required double confidence,
    required DateTime analyzedAt,
    required ClassificationMetadata metadata,
  }) = _SongClassification;

  factory SongClassification.fromJson(Map<String, dynamic> json) => _$SongClassificationFromJson(json);

  const SongClassification._();

  String get primaryMood => moods.isNotEmpty ? moods.first : '';
  String get primaryContext => contexts.isNotEmpty ? contexts.first : '';
  String get primaryStyle => styles.isNotEmpty ? styles.first : '';

  bool hasCategory(String category, ClassificationCategory type) {
    return switch (type) {
      ClassificationCategory.mood => moods.contains(category),
      ClassificationCategory.context => contexts.contains(category),
      ClassificationCategory.style => styles.contains(category),
    };
  }

  List<String> getAllCategories() {
    return [...moods, ...contexts, ...styles];
  }
}

@freezed
abstract class ClassificationMetadata with _$ClassificationMetadata {
  const factory ClassificationMetadata({
    required String modelUsed,
    required String promptVersion,
    required Duration processingTime,
    required Map<String, dynamic> audioFeatures,
    required double confidenceScore,
  }) = _ClassificationMetadata;

  factory ClassificationMetadata.fromJson(Map<String, dynamic> json) => _$ClassificationMetadataFromJson(json);
}

enum ClassificationCategory {
  mood,
  context,
  style,
}