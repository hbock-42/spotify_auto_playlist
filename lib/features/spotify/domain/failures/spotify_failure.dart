import 'package:freezed_annotation/freezed_annotation.dart';

part 'spotify_failure.freezed.dart';

@freezed
abstract class SpotifyFailure with _$SpotifyFailure {
  const factory SpotifyFailure.unauthorized() = _Unauthorized;
  const factory SpotifyFailure.forbidden() = _Forbidden;
  const factory SpotifyFailure.notFound() = _NotFound;
  const factory SpotifyFailure.rateLimited() = _RateLimited;
  const factory SpotifyFailure.serverError(String message) = _ServerError;
  const factory SpotifyFailure.networkError(String message) = _NetworkError;
  const factory SpotifyFailure.parseError(String message) = _ParseError;
  const factory SpotifyFailure.unknown(String message) = _Unknown;
}
