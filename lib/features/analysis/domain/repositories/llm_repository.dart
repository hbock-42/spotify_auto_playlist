import 'package:fpdart/fpdart.dart';
import '../entities/song_analysis.dart';
import '../failures/llm_failure.dart';

abstract class LlmRepository {
  Future<Either<LlmFailure, SongAnalysis>> analyzeSong(SongMetadata metadata);
  Future<Either<LlmFailure, List<SongAnalysis>>> analyzeSongs(List<SongMetadata> metadata);
  Future<Either<LlmFailure, bool>> isModelAvailable();
}