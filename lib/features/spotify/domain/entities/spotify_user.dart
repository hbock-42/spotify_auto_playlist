import 'package:freezed_annotation/freezed_annotation.dart';

part 'spotify_user.freezed.dart';
part 'spotify_user.g.dart';

@freezed
abstract class SpotifyUser with _$SpotifyUser {
  const factory SpotifyUser({
    required String id,
    required String displayName,
    String? email,
    int? followers,
    String? country,
    String? imageUrl,
  }) = _SpotifyUser;

  factory SpotifyUser.fromJson(Map<String, dynamic> json) => _$SpotifyUserFromJson(json);
}
