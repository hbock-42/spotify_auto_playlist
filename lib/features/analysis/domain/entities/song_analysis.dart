import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_analysis.freezed.dart';
part 'song_analysis.g.dart';

@freezed
abstract class SongAnalysis with _$SongAnalysis {
  const factory SongAnalysis({
    required String trackId,
    required List<String> moods,
    required List<String> contexts,
    required List<String> styles,
    required double confidence,
    required DateTime analyzedAt,
  }) = _SongAnalysis;

  factory SongAnalysis.fromJson(Map<String, dynamic> json) => _$SongAnalysisFromJson(json);
}

@freezed
abstract class SongMetadata with _$SongMetadata {
  const factory SongMetadata({
    required String title,
    required String artist,
    required List<String> genres,
    required double energy,
    required double danceability,
    required double valence,
    required double tempo,
    required double acousticness,
  }) = _SongMetadata;

  factory SongMetadata.fromJson(Map<String, dynamic> json) => _$SongMetadataFromJson(json);
}
