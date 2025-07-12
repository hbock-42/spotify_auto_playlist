import 'package:freezed_annotation/freezed_annotation.dart';

part 'llm_failure.freezed.dart';

@freezed
sealed class LlmFailure with _$LlmFailure {
  const factory LlmFailure.networkError(String message) = _NetworkError;
  const factory LlmFailure.serverError(String message) = _ServerError;
  const factory LlmFailure.invalidResponse(String message) = _InvalidResponse;
  const factory LlmFailure.modelNotAvailable(String message) = _ModelNotAvailable;
  const factory LlmFailure.rateLimited() = _RateLimited;
  const factory LlmFailure.timeout() = _Timeout;
  const factory LlmFailure.unknown(String message) = _Unknown;
}

extension LlmFailureX on LlmFailure {
  String get message => when(
    networkError: (message) => 'Network error: $message',
    serverError: (message) => 'Server error: $message',
    invalidResponse: (message) => 'Invalid response: $message',
    modelNotAvailable: (message) => 'Model not available: $message',
    rateLimited: () => 'Rate limit exceeded',
    timeout: () => 'Request timeout',
    unknown: (message) => 'Unknown error: $message',
  );
}
