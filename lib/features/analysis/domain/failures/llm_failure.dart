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
