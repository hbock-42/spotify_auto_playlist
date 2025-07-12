import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist_creation_failure.freezed.dart';

@freezed
sealed class PlaylistCreationFailure with _$PlaylistCreationFailure {
  factory PlaylistCreationFailure.unauthorized(String message) = _Unauthorized;
  factory PlaylistCreationFailure.forbidden(String message) = _Forbidden;
  factory PlaylistCreationFailure.invalidRequest(String message) = _InvalidRequest;
  factory PlaylistCreationFailure.trackNotFound(String trackId) = _TrackNotFound;
  factory PlaylistCreationFailure.rateLimitExceeded(String message) = _RateLimitExceeded;
  factory PlaylistCreationFailure.networkError(String message) = _NetworkError;
  factory PlaylistCreationFailure.serverError(String message) = _ServerError;
  factory PlaylistCreationFailure.unknown(String message) = _Unknown;
}