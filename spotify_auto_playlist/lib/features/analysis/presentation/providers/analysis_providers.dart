import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/batch_analysis_progress.dart';
import '../../domain/failures/analysis_failure.dart';
import 'llm_providers.dart';

// Provider for batch analysis state
final batchAnalysisProvider = StateNotifierProvider.family<BatchAnalysisNotifier, BatchAnalysisState, String>(
  (ref, playlistId) => BatchAnalysisNotifier(ref, playlistId),
);

class BatchAnalysisNotifier extends StateNotifier<BatchAnalysisState> {
  BatchAnalysisNotifier(this._ref, this.playlistId) : super(const BatchAnalysisState.idle());

  final Ref _ref;
  final String playlistId;
  StreamSubscription<BatchAnalysisProgress>? _progressSubscription;

  Future<void> startAnalysis() async {
    final analysisService = _ref.read(analysisServiceProvider);
    
    // Start the analysis
    final result = await analysisService.analyzePlaylist(
      playlistId,
      concurrency: 3,
      delay: const Duration(seconds: 1),
    );
    
    result.fold(
      (failure) {
        state = BatchAnalysisState.error(failure.message, null);
      },
      (progressStream) {
        // Listen to progress updates
        _progressSubscription = progressStream.listen(
          (progress) {
            if (progress.isCompleted) {
              state = BatchAnalysisState.completed(progress);
            } else if (progress.isPaused) {
              state = BatchAnalysisState.paused(progress);
            } else if (progress.isCancelled) {
              state = BatchAnalysisState.error('Analysis was cancelled', progress);
            } else {
              state = BatchAnalysisState.running(progress);
            }
          },
          onError: (error) {
            state = BatchAnalysisState.error(error.toString(), null);
          },
        );
      },
    );
  }

  void pauseAnalysis() {
    final currentState = state;
    currentState.maybeWhen(
      running: (progress) {
        final pausedProgress = progress.copyWith(isPaused: true);
        state = BatchAnalysisState.paused(pausedProgress);
      },
      orElse: () {},
    );
  }

  void resumeAnalysis() {
    final currentState = state;
    currentState.maybeWhen(
      paused: (progress) {
        final resumedProgress = progress.copyWith(isPaused: false);
        state = BatchAnalysisState.running(resumedProgress);
      },
      orElse: () {},
    );
  }

  void cancelAnalysis() {
    _progressSubscription?.cancel();
    final currentState = state;
    currentState.maybeWhen(
      running: (progress) {
        final cancelledProgress = progress.copyWith(isCancelled: true);
        state = BatchAnalysisState.error('Analysis was cancelled', cancelledProgress);
      },
      paused: (progress) {
        final cancelledProgress = progress.copyWith(isCancelled: true);
        state = BatchAnalysisState.error('Analysis was cancelled', cancelledProgress);
      },
      orElse: () {},
    );
  }

  @override
  void dispose() {
    _progressSubscription?.cancel();
    super.dispose();
  }
}