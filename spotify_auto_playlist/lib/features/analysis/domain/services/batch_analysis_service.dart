import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../data/repositories/llm_repository_impl.dart';
import '../entities/batch_analysis_progress.dart';
import '../entities/song_analysis.dart';
import '../failures/llm_failure.dart';
import '../repositories/llm_repository.dart';

class BatchAnalysisService {
  BatchAnalysisService({required LlmRepository repository}) : _repository = repository;

  final LlmRepository _repository;
  final StreamController<BatchAnalysisState> _stateController =
      StreamController<BatchAnalysisState>.broadcast();

  StreamController<BatchAnalysisProgress>? _progressController;
  bool _isPaused = false;
  bool _isCancelled = false;

  Stream<BatchAnalysisState> get stateStream => _stateController.stream;

  Future<Either<LlmFailure, List<SongAnalysis>>> analyzeSongsWithProgress(
    List<SongMetadata> metadata, {
    int concurrency = 3,
    Duration? delay,
  }) async {
    if (metadata.isEmpty) {
      return const Right([]);
    }

    _isPaused = false;
    _isCancelled = false;

    final progress = BatchAnalysisProgress(
      totalSongs: metadata.length,
      completedSongs: 0,
      failedSongs: 0,
      completedAnalyses: [],
      failedSongTitles: [],
    );

    _stateController.add(BatchAnalysisState.running(progress));

    final results = <SongAnalysis>[];
    final failures = <LlmFailure>[];
    final failedTitles = <String>[];
    final semaphore = Semaphore(concurrency);
    final futures = <Future<void>>[];

    for (int i = 0; i < metadata.length; i++) {
      final songMetadata = metadata[i];

      final future = semaphore.acquire().then((_) async {
        try {
          // Check for pause/cancellation before processing
          await _waitIfPaused();
          if (_isCancelled) return;

          // Update current song being processed
          final currentProgress = progress.copyWith(
            currentSongTitle: '${songMetadata.title} - ${songMetadata.artist}',
          );
          _stateController.add(BatchAnalysisState.running(currentProgress));

          // Add delay between requests if specified (rate limiting)
          if (delay != null && i > 0) {
            await Future.delayed(delay);
          }

          final result = await _repository.analyzeSong(songMetadata);

          if (_isCancelled) return;

          result.fold(
            (failure) {
              failures.add(failure);
              failedTitles.add('${songMetadata.title} - ${songMetadata.artist}');
            },
            (analysis) {
              results.add(analysis);
            },
          );

          // Update progress
          final updatedProgress = progress.copyWith(
            completedSongs: results.length,
            failedSongs: failedTitles.length,
            completedAnalyses: [...results],
            failedSongTitles: [...failedTitles],
            currentSongTitle: null,
          );

          if (_isPaused) {
            _stateController.add(BatchAnalysisState.paused(updatedProgress));
          } else {
            _stateController.add(BatchAnalysisState.running(updatedProgress));
          }
        } finally {
          semaphore.release();
        }
      });

      futures.add(future);
    }

    // Wait for all analyses to complete
    await Future.wait(futures);

    if (_isCancelled) {
      final finalProgress = progress.copyWith(
        completedSongs: results.length,
        failedSongs: failedTitles.length,
        completedAnalyses: [...results],
        failedSongTitles: [...failedTitles],
        isCancelled: true,
      );
      _stateController.add(BatchAnalysisState.error('Analysis cancelled', finalProgress));
      return Left(LlmFailure.unknown('Analysis was cancelled'));
    }

    // Sort results to maintain original order
    results.sort((a, b) {
      final aIndex = metadata.indexWhere((m) => '${m.title}_${m.artist}' == a.trackId);
      final bIndex = metadata.indexWhere((m) => '${m.title}_${m.artist}' == b.trackId);
      return aIndex.compareTo(bIndex);
    });

    final finalProgress = progress.copyWith(
      completedSongs: results.length,
      failedSongs: failedTitles.length,
      completedAnalyses: [...results],
      failedSongTitles: [...failedTitles],
      isCompleted: true,
    );

    if (failures.isNotEmpty) {
      _stateController.add(BatchAnalysisState.error('Some songs failed to analyze', finalProgress));
      return Left(failures.first);
    }

    _stateController.add(BatchAnalysisState.completed(finalProgress));
    return Right(results);
  }

  void pause() {
    _isPaused = true;
  }

  void resume() {
    _isPaused = false;
  }

  void cancel() {
    _isCancelled = true;
    _isPaused = false;
  }

  Future<void> _waitIfPaused() async {
    while (_isPaused && !_isCancelled) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void dispose() {
    _stateController.close();
    _progressController?.close();
  }
}
