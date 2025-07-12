import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_statistics.freezed.dart';
part 'analysis_statistics.g.dart';

@freezed
abstract class AnalysisStatistics with _$AnalysisStatistics {
  const factory AnalysisStatistics({
    required int totalAnalyses,
    required Map<String, int> moodCounts,
    required Map<String, int> contextCounts,
    required Map<String, int> styleCounts,
    required double averageConfidence,
    required DateTime? lastAnalyzedAt,
    required DateTime? firstAnalyzedAt,
  }) = _AnalysisStatistics;

  factory AnalysisStatistics.fromJson(Map<String, dynamic> json) =>
      _$AnalysisStatisticsFromJson(json);
}