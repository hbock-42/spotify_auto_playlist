import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist.freezed.dart';
part 'playlist.g.dart';

@freezed
abstract class Playlist with _$Playlist {
  const factory Playlist({
    required String id,
    required String name,
    required String description,
    required String ownerId,
    required String ownerDisplayName,
    required bool? isPublic,
    required bool isCollaborative,
    required int? totalTracks,
    required List<Track> tracks,
    required String? imageUrl,
    required String externalUrl,
    required DateTime createdAt,
    required DateTime? modifiedAt,
  }) = _Playlist;

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);
}

@freezed
abstract class Track with _$Track {
  const factory Track({
    required String id,
    required String name,
    required String artistName,
    required String albumName,
    required int durationMs,
    required String? previewUrl,
    required String externalUrl,
    required String? imageUrl,
    required bool isExplicit,
    required int popularity,
    required DateTime addedAt,
    required AudioFeatures? audioFeatures,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

@freezed
abstract class AudioFeatures with _$AudioFeatures {
  const factory AudioFeatures({
    required String id,
    required double acousticness,
    required double danceability,
    required double energy,
    required double instrumentalness,
    required int key,
    required double liveness,
    required double loudness,
    required int mode,
    required double speechiness,
    required double tempo,
    required int timeSignature,
    required double valence,
  }) = _AudioFeatures;

  factory AudioFeatures.fromJson(Map<String, dynamic> json) => _$AudioFeaturesFromJson(json);
}