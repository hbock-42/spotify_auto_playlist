import 'package:freezed_annotation/freezed_annotation.dart';

import 'spotify_track.dart';
import 'spotify_user.dart';

part 'spotify_playlist.freezed.dart';
part 'spotify_playlist.g.dart';

@freezed
abstract class SpotifyPlaylist with _$SpotifyPlaylist {
  const factory SpotifyPlaylist({
    required String id,
    required String name,
    String? description,
    required SpotifyUser owner,
    required bool public,
    required bool collaborative,
    required int totalTracks,
    required String uri,
    required String href,
    required List<SpotifyImage> images,
    String? snapshotId,
    List<SpotifyTrack>? tracks,
  }) = _SpotifyPlaylist;

  const SpotifyPlaylist._();

  factory SpotifyPlaylist.fromJson(Map<String, dynamic> json) => _$SpotifyPlaylistFromJson(json);

  bool get hasImage => images.isNotEmpty;
  String? get imageUrl => hasImage ? images.first.url : null;
}
