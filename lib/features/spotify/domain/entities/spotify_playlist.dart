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
    bool? public,
    required bool collaborative,
    required String uri,
    required String href,
    @Default([]) List<SpotifyImage> images,
    @JsonKey(name: 'snapshot_id') String? snapshotId,
    required SpotifyTracksRef tracks,
  }) = _SpotifyPlaylist;

  const SpotifyPlaylist._();

  factory SpotifyPlaylist.fromJson(Map<String, dynamic> json) => _$SpotifyPlaylistFromJson(json);

  bool get hasImage => images.isNotEmpty;
  String? get imageUrl => hasImage ? images.first.url : null;
  int? get totalTracks => tracks.total;
}

@freezed
abstract class SpotifyTracksRef with _$SpotifyTracksRef {
  const factory SpotifyTracksRef({
    required String href,
    required int total,
  }) = _SpotifyTracksRef;

  factory SpotifyTracksRef.fromJson(Map<String, dynamic> json) => _$SpotifyTracksRefFromJson(json);
}
