import 'package:fpdart/fpdart.dart';
import '../entities/song_analysis.dart';
import '../failures/llm_failure.dart';

abstract class LlmRepository {
  Future<Either<LlmFailure, SongAnalysis>> analyzeSong(
    SongMetadata metadata, {
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  });
  Future<Either<LlmFailure, List<SongAnalysis>>> analyzeSongs(
    List<SongMetadata> metadata, {
    int concurrency = 3,
    Duration? delay,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  });
  Future<Either<LlmFailure, bool>> isModelAvailable();
}