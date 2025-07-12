import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/clients/ollama_api_client.dart';
import '../../data/repositories/llm_repository_impl.dart';
import '../../domain/repositories/llm_repository.dart';

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