import 'package:fpdart/fpdart.dart';
import '../entities/spotify_playlist.dart';
import '../entities/spotify_track.dart';
import '../entities/spotify_user.dart';
import '../failures/spotify_failure.dart';

abstract class SpotifyRepository {
  Future<Either<SpotifyFailure, SpotifyUser>> getCurrentUser();
  
  Future<Either<SpotifyFailure, List<SpotifyPlaylist>>> getUserPlaylists({
    int limit = 20,
    int offset = 0,
  });
  
  Future<Either<SpotifyFailure, SpotifyPlaylist>> getPlaylist(String playlistId);
  
  Future<Either<SpotifyFailure, List<SpotifyTrack>>> getPlaylistTracks(
    String playlistId, {
    int limit = 50,
    int offset = 0,
  });
  
  Future<Either<SpotifyFailure, SpotifyPlaylist>> createPlaylist({
    required String name,
    String? description,
    bool public = false,
  });
  
  Future<Either<SpotifyFailure, void>> addTracksToPlaylist(
    String playlistId,
    List<String> trackUris,
  );
  
  Future<Either<SpotifyFailure, Map<String, dynamic>>> getAudioFeatures(List<String> trackIds);
}