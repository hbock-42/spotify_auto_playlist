import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/clients/ollama_api_client.dart';
import '../../data/repositories/llm_repository_impl.dart';
import '../../data/repositories/analysis_storage_repository_impl.dart';
import '../../domain/repositories/llm_repository.dart';
import '../../domain/repositories/analysis_storage_repository.dart';
import '../../domain/services/batch_analysis_service.dart';

final ollamaApiClientProvider = Provider<OllamaApiClient>((ref) {
  final dio = ref.watch(dioProvider);
  final logger = ref.watch(loggerProvider);
  
  return OllamaApiClient(
    dio: dio,
    logger: logger,
  );
});

final llmRepositoryProvider = Provider<LlmRepository>((ref) {
  final apiClient = ref.watch(ollamaApiClientProvider);
  
  return LlmRepositoryImpl(
    apiClient: apiClient,
  );
});

final analysisStorageRepositoryProvider = Provider<AnalysisStorageRepository>((ref) {
  return AnalysisStorageRepositoryImpl();
});

final batchAnalysisServiceProvider = Provider<BatchAnalysisService>((ref) {
  final repository = ref.watch(llmRepositoryProvider);
  
  return BatchAnalysisService(
    repository: repository,
  );
});