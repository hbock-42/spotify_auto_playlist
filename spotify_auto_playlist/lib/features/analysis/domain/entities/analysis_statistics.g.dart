// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalysisStatistics _$AnalysisStatisticsFromJson(Map<String, dynamic> json) =>
    _AnalysisStatistics(
      totalAnalyses: (json['totalAnalyses'] as num).toInt(),
      moodCounts: Map<String, int>.from(json['moodCounts'] as Map),
      contextCounts: Map<String, int>.from(json['contextCounts'] as Map),
      styleCounts: Map<String, int>.from(json['styleCounts'] as Map),
      averageConfidence: (json['averageConfidence'] as num).toDouble(),
      lastAnalyzedAt: json['lastAnalyzedAt'] == null
          ? null
          : DateTime.parse(json['lastAnalyzedAt'] as String),
      firstAnalyzedAt: json['firstAnalyzedAt'] == null
          ? null
          : DateTime.parse(json['firstAnalyzedAt'] as String),
    );

Map<String, dynamic> _$AnalysisStatisticsToJson(_AnalysisStatistics instance) =>
    <String, dynamic>{
      'totalAnalyses': instance.totalAnalyses,
      'moodCounts': instance.moodCounts,
      'contextCounts': instance.contextCounts,
      'styleCounts': instance.styleCounts,
      'averageConfidence': instance.averageConfidence,
      'lastAnalyzedAt': instance.lastAnalyzedAt?.toIso8601String(),
      'firstAnalyzedAt': instance.firstAnalyzedAt?.toIso8601String(),
    };
