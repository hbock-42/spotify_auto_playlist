// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_analysis_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchAnalysisProgress _$BatchAnalysisProgressFromJson(
  Map<String, dynamic> json,
) => _BatchAnalysisProgress(
  totalSongs: (json['totalSongs'] as num).toInt(),
  completedSongs: (json['completedSongs'] as num).toInt(),
  failedSongs: (json['failedSongs'] as num).toInt(),
  completedAnalyses: (json['completedAnalyses'] as List<dynamic>)
      .map((e) => SongAnalysis.fromJson(e as Map<String, dynamic>))
      .toList(),
  failedSongTitles: (json['failedSongTitles'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  currentSongTitle: json['currentSongTitle'] as String?,
  isCompleted: json['isCompleted'] as bool? ?? false,
  isPaused: json['isPaused'] as bool? ?? false,
  isCancelled: json['isCancelled'] as bool? ?? false,
);

Map<String, dynamic> _$BatchAnalysisProgressToJson(
  _BatchAnalysisProgress instance,
) => <String, dynamic>{
  'totalSongs': instance.totalSongs,
  'completedSongs': instance.completedSongs,
  'failedSongs': instance.failedSongs,
  'completedAnalyses': instance.completedAnalyses,
  'failedSongTitles': instance.failedSongTitles,
  'currentSongTitle': instance.currentSongTitle,
  'isCompleted': instance.isCompleted,
  'isPaused': instance.isPaused,
  'isCancelled': instance.isCancelled,
};
