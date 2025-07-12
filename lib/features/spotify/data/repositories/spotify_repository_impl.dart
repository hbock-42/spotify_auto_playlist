import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/spotify_playlist.dart';
import '../../domain/entities/spotify_track.dart';
import '../../domain/entities/spotify_user.dart';
import '../../domain/failures/spotify_failure.dart';
import '../../domain/repositories/spotify_repository.dart';
import '../clients/spotify_api_client.dart';

class SpotifyRepositoryImpl implements SpotifyRepository {
  final SpotifyApiClient _apiClient;
  final Logger _logger;

  SpotifyRepositoryImpl({
    required SpotifyApiClient apiClient,
    required Logger logger,
  })  : _apiClient = apiClient,
        _logger = logger;

  @override
  Future<Either<SpotifyFailure, SpotifyUser>> getCurrentUser() async {
    final result = await _apiClient.getCurrentUser();
    
    return result.fold(
      (failure) => Left(failure),
      (data) {
        try {
          final user = SpotifyUser.fromJson(data);
          return Right(user);
        } catch (e) {
          _logger.e('Failed to parse user data: $e');
          return Left(SpotifyFailure.parseError('Failed to parse user data'));
        }
      },
    );
  }

  @override
  Future<Either<SpotifyFailure, List<SpotifyPlaylist>>> getUserPlaylists({
    int limit = 20,
    int offset = 0,
  }) async {
    final result = await _apiClient.getUserPlaylists(
      limit: limit,
      offset: offset,
    );
    
    return result.fold(
      (failure) => Left(failure),
      (data) {
        try {
          final items = data['items'] as List<dynamic>;
          final playlists = items
              .cast<Map<String, dynamic>>()
              .map(SpotifyPlaylist.fromJson)
              .toList();
          
          return Right(playlists);
        } catch (e) {
          _logger.e('Failed to parse playlists data: $e');
          return Left(SpotifyFailure.parseError('Failed to parse playlists data'));
        }
      },
    );
  }

  @override
  Future<Either<SpotifyFailure, SpotifyPlaylist>> getPlaylist(String playlistId) async {
    final result = await _apiClient.getPlaylist(playlistId);
    
    return result.fold(
      (failure) => Left(failure),
      (data) {
        try {
          final playlist = SpotifyPlaylist.fromJson(data);
          return Right(playlist);
        } catch (e) {
          _logger.e('Failed to parse playlist data: $e');
          return Left(SpotifyFailure.parseError('Failed to parse playlist data'));
        }
      },
    );
  }

  @override
  Future<Either<SpotifyFailure, List<SpotifyTrack>>> getPlaylistTracks(
    String playlistId, {
    int limit = 50,
    int offset = 0,
  }) async {
    final result = await _apiClient.getPlaylistTracks(
      playlistId,
      limit: limit,
      offset: offset,
    );
    
    return result.fold(
      (failure) => Left(failure),
      (data) {
        try {
          final items = data['items'] as List<dynamic>;
          final tracks = items
              .cast<Map<String, dynamic>>()
              .where((item) => item['track'] != null)
              .map((item) => SpotifyTrack.fromJson(item['track']))
              .toList();
          
          return Right(tracks);
        } catch (e) {
          _logger.e('Failed to parse tracks data: $e');
          return Left(SpotifyFailure.parseError('Failed to parse tracks data'));
        }
      },
    );
  }

  @override
  Future<Either<SpotifyFailure, SpotifyPlaylist>> createPlaylist({
    required String name,
    String? description,
    bool public = false,
  }) async {
    // First get current user to get user ID
    final userResult = await getCurrentUser();
    
    return userResult.fold(
      (failure) => Left(failure),
      (user) async {
        final result = await _apiClient.createPlaylist(
          userId: user.id,
          name: name,
          description: description,
          public: public,
        );
        
        return result.fold(
          (failure) => Left(failure),
          (data) {
            try {
              final playlist = SpotifyPlaylist.fromJson(data);
              return Right(playlist);
            } catch (e) {
              _logger.e('Failed to parse created playlist data: $e');
              return Left(SpotifyFailure.parseError('Failed to parse created playlist data'));
            }
          },
        );
      },
    );
  }

  @override
  Future<Either<SpotifyFailure, void>> addTracksToPlaylist(
    String playlistId,
    List<String> trackUris,
  ) async {
    return _apiClient.addTracksToPlaylist(playlistId, trackUris);
  }

  @override
  Future<Either<SpotifyFailure, Map<String, dynamic>>> getAudioFeatures(List<String> trackIds) async {
    return _apiClient.getAudioFeatures(trackIds);
  }
}