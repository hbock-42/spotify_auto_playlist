import 'dart:async';
import 'dart:collection';

import 'package:fpdart/fpdart.dart';

import '../../domain/entities/song_analysis.dart';
import '../../domain/failures/llm_failure.dart';
import '../../domain/repositories/llm_repository.dart';
import '../clients/ollama_api_client.dart';

/// A semaphore implementation for controlling concurrent access
class Semaphore {
  Semaphore(this.maxCount) : _currentCount = maxCount;

  final int maxCount;
  int _currentCount;
  final Queue<Completer<void>> _waitQueue = Queue<Completer<void>>();

  Future<void> acquire() async {
    if (_currentCount > 0) {
      _currentCount--;
      return;
    }

    final completer = Completer<void>();
    _waitQueue.add(completer);
    return completer.future;
  }

  void release() {
    if (_waitQueue.isNotEmpty) {
      final completer = _waitQueue.removeFirst();
      completer.complete();
    } else {
      _currentCount++;
    }
  }
}

class LlmRepositoryImpl implements LlmRepository {
  LlmRepositoryImpl({
    required OllamaApiClient apiClient,
  }) : _apiClient = apiClient;
  final OllamaApiClient _apiClient;

  @override
  Future<Either<LlmFailure, SongAnalysis>> analyzeSong(
    SongMetadata metadata, {
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) {
    return _apiClient.analyzeSong(
      metadata,
      maxRetries: maxRetries,
      retryDelay: retryDelay,
    );
  }

  @override
  Future<Either<LlmFailure, List<SongAnalysis>>> analyzeSongs(
    List<SongMetadata> metadata, {
    int concurrency = 3,
    Duration? delay,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    if (metadata.isEmpty) {
      return const Right([]);
    }

    final results = <SongAnalysis>[];
    final failures = <LlmFailure>[];
    final semaphore = Semaphore(concurrency);
    final futures = <Future<void>>[];

    for (int i = 0; i < metadata.length; i++) {
      final songMetadata = metadata[i];

      final future = semaphore.acquire().then((_) async {
        try {
          // Add delay between requests if specified (rate limiting)
          if (delay != null && i > 0) {
            await Future.delayed(delay);
          }

          final result = await analyzeSong(
            songMetadata,
            maxRetries: maxRetries,
            retryDelay: retryDelay,
          );

          result.fold(
            (failure) => failures.add(failure),
            (analysis) => results.add(analysis),
          );
        } finally {
          semaphore.release();
        }
      });

      futures.add(future);
    }

    // Wait for all analyses to complete
    await Future.wait(futures);

    // If there were any failures, return the first one
    if (failures.isNotEmpty) {
      return Left(failures.first);
    }

    // Sort results to maintain original order (they might complete out of order)
    results.sort((a, b) {
      final aIndex = metadata.indexWhere((m) => '${m.title}_${m.artist}' == a.trackId);
      final bIndex = metadata.indexWhere((m) => '${m.title}_${m.artist}' == b.trackId);
      return aIndex.compareTo(bIndex);
    });

    return Right(results);
  }

  @override
  Future<Either<LlmFailure, bool>> isModelAvailable() {
    return _apiClient.isModelAvailable();
  }
}
