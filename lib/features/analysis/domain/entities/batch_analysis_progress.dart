import 'package:freezed_annotation/freezed_annotation.dart';
import 'song_analysis.dart';

part 'batch_analysis_progress.freezed.dart';
part 'batch_analysis_progress.g.dart';

@freezed
abstract class BatchAnalysisProgress with _$BatchAnalysisProgress {
  const factory BatchAnalysisProgress({
    required int totalSongs,
    required int completedSongs,
    required int failedSongs,
    required List<SongAnalysis> completedAnalyses,
    required List<String> failedSongTitles,
    String? currentSongTitle,
    @Default(false) bool isCompleted,
    @Default(false) bool isPaused,
    @Default(false) bool isCancelled,
  }) = _BatchAnalysisProgress;

  factory BatchAnalysisProgress.fromJson(Map<String, dynamic> json) =>
      _$BatchAnalysisProgressFromJson(json);
}

@freezed
abstract class BatchAnalysisState with _$BatchAnalysisState {
  const factory BatchAnalysisState.idle() = _Idle;
  const factory BatchAnalysisState.running(BatchAnalysisProgress progress) = _Running;
  const factory BatchAnalysisState.paused(BatchAnalysisProgress progress) = _Paused;
  const factory BatchAnalysisState.completed(BatchAnalysisProgress progress) = _Completed;
  const factory BatchAnalysisState.error(String message, BatchAnalysisProgress? progress) = _Error;
}