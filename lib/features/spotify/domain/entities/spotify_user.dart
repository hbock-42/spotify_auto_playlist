import 'package:freezed_annotation/freezed_annotation.dart';
import 'spotify_track.dart';

part 'spotify_user.freezed.dart';
part 'spotify_user.g.dart';

@freezed
abstract class SpotifyUser with _$SpotifyUser {
  const factory SpotifyUser({
    required String id,
    @JsonKey(name: 'display_name') String? displayName,
    String? email,
    SpotifyFollowers? followers,
    String? country,
    @Default([]) List<SpotifyImage> images,
    required String href,
    required String uri,
    @JsonKey(name: 'external_urls') Map<String, String>? externalUrls,
  }) = _SpotifyUser;

  factory SpotifyUser.fromJson(Map<String, dynamic> json) => _$SpotifyUserFromJson(json);

  const SpotifyUser._();

  String? get imageUrl => images.isNotEmpty ? images.first.url : null;
}

@freezed
abstract class SpotifyFollowers with _$SpotifyFollowers {
  const factory SpotifyFollowers({
    String? href,
    required int total,
  }) = _SpotifyFollowers;

  factory SpotifyFollowers.fromJson(Map<String, dynamic> json) => _$SpotifyFollowersFromJson(json);
}
