import 'package:freezed_annotation/freezed_annotation.dart';

part 'spotify_track.freezed.dart';
part 'spotify_track.g.dart';

@freezed
abstract class SpotifyTrack with _$SpotifyTrack {
  const factory SpotifyTrack({
    required String id,
    required String name,
    required List<SpotifyArtist> artists,
    required SpotifyAlbum album,
    required int durationMs,
    required String uri,
    required String href,
    String? previewUrl,
    required bool isLocal,
    required int popularity,
    required bool explicit,
  }) = _SpotifyTrack;

  factory SpotifyTrack.fromJson(Map<String, dynamic> json) => _$SpotifyTrackFromJson(json);
}

@freezed
abstract class SpotifyArtist with _$SpotifyArtist {
  const factory SpotifyArtist({
    required String id,
    required String name,
    required String uri,
    required String href,
  }) = _SpotifyArtist;

  factory SpotifyArtist.fromJson(Map<String, dynamic> json) => _$SpotifyArtistFromJson(json);
}

@freezed
abstract class SpotifyAlbum with _$SpotifyAlbum {
  const factory SpotifyAlbum({
    required String id,
    required String name,
    required String albumType,
    required String releaseDate,
    required int totalTracks,
    required String uri,
    required String href,
    required List<SpotifyImage> images,
  }) = _SpotifyAlbum;

  factory SpotifyAlbum.fromJson(Map<String, dynamic> json) => _$SpotifyAlbumFromJson(json);
}

@freezed
abstract class SpotifyImage with _$SpotifyImage {
  const factory SpotifyImage({
    required String url,
    int? height,
    int? width,
  }) = _SpotifyImage;

  factory SpotifyImage.fromJson(Map<String, dynamic> json) => _$SpotifyImageFromJson(json);
}
