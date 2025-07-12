import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.userCancelled() = _UserCancelled;
  const factory AuthFailure.authorizationFailed(String message) = _AuthorizationFailed;
  const factory AuthFailure.tokenExpired() = _TokenExpired;
  const factory AuthFailure.tokenRefreshFailed(String message) = _TokenRefreshFailed;
  const factory AuthFailure.networkError(String message) = _NetworkError;
  const factory AuthFailure.storageError(String message) = _StorageError;
  const factory AuthFailure.invalidConfiguration(String message) = _InvalidConfiguration;
  const factory AuthFailure.unknown(String message) = _Unknown;
}
