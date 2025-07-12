import 'package:fpdart/fpdart.dart';
import '../../domain/entities/song_analysis.dart';
import '../../domain/failures/llm_failure.dart';
import '../../domain/repositories/llm_repository.dart';
import '../clients/ollama_api_client.dart';

class LlmRepositoryImpl implements LlmRepository {
  final OllamaApiClient _apiClient;

  LlmRepositoryImpl({
    required OllamaApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<Either<LlmFailure, SongAnalysis>> analyzeSong(SongMetadata metadata) {
    return _apiClient.analyzeSong(metadata);
  }

  @override
  Future<Either<LlmFailure, List<SongAnalysis>>> analyzeSongs(List<SongMetadata> metadata) async {
    final results = <SongAnalysis>[];
    
    for (final songMetadata in metadata) {
      final result = await analyzeSong(songMetadata);
      
      await result.fold(
        (failure) async => Left(failure),
        (analysis) async {
          results.add(analysis);
          return Right(analysis);
        },
      );
      
      // If any analysis fails, return the failure
      if (result.isLeft()) {
        return result.fold(
          (failure) => Left(failure),
          (_) => throw StateError('This should never happen'),
        );
      }
    }
    
    return Right(results);
  }

  @override
  Future<Either<LlmFailure, bool>> isModelAvailable() {
    return _apiClient.isModelAvailable();
  }
}