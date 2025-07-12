import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_failure.freezed.dart';

@freezed
abstract class AnalysisFailure with _$AnalysisFailure {
  const factory AnalysisFailure.spotifyError(String message) = _SpotifyError;
  const factory AnalysisFailure.llmError(String message) = _LlmError;
  const factory AnalysisFailure.emptyPlaylist() = _EmptyPlaylist;
  const factory AnalysisFailure.cancelled() = _Cancelled;
  const factory AnalysisFailure.unknown(String message) = _Unknown;
}

extension AnalysisFailureX on AnalysisFailure {
  String get message => when(
    spotifyError: (message) => 'Spotify error: $message',
    llmError: (message) => 'LLM error: $message',
    emptyPlaylist: () => 'The selected playlist is empty',
    cancelled: () => 'Analysis was cancelled',
    unknown: (message) => 'Unknown error: $message',
  );
}