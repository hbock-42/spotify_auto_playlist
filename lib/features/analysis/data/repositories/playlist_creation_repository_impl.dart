import 'package:fpdart/fpdart.dart';

import '../../../../features/spotify/domain/entities/spotify_playlist.dart';
import '../../../../features/spotify/domain/repositories/spotify_repository.dart';
import '../../domain/entities/playlist.dart';
import '../../domain/entities/playlist_proposal.dart';
import '../../domain/failures/playlist_creation_failure.dart';
import '../../domain/repositories/playlist_creation_repository.dart';

class PlaylistCreationRepositoryImpl implements PlaylistCreationRepository {
  PlaylistCreationRepositoryImpl({
    required SpotifyRepository spotifyRepository,
  }) : _spotifyRepository = spotifyRepository;
  final SpotifyRepository _spotifyRepository;

  @override
  Future<Either<PlaylistCreationFailure, Playlist>> createPlaylist(
    PlaylistCreationRequest request,
  ) async {
    try {
      // Validate the request first
      final validationResult = await validatePlaylistCreation(request);
      final isValid = validationResult.fold(
        (failure) => false,
        (valid) => valid,
      );

      if (!isValid) {
        return Left(
          PlaylistCreationFailure.invalidRequest(
            'Invalid playlist creation request for ${request.proposalId}',
          ),
        );
      }

      // Create the playlist via Spotify API
      final createResult = await _spotifyRepository.createPlaylist(
        name: request.playlistName,
        description: request.description,
        public: request.isPublic,
      );

      return createResult.fold(
        (spotifyFailure) => Left(_mapSpotifyFailure(spotifyFailure)),
        (createdSpotifyPlaylist) async {
          // Add tracks to the playlist
          final trackUris = request.trackIds.map((id) => 'spotify:track:$id').toList();
          final addTracksResult = await _spotifyRepository.addTracksToPlaylist(
            createdSpotifyPlaylist.id,
            trackUris,
          );

          return addTracksResult.fold(
            (spotifyFailure) => Left(_mapSpotifyFailure(spotifyFailure)),
            (_) => Right(_mapSpotifyPlaylistToPlaylist(createdSpotifyPlaylist)),
          );
        },
      );
    } catch (e) {
      return Left(PlaylistCreationFailure.unknown('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<PlaylistCreationFailure, List<Playlist>>> createPlaylists(
    BatchCreationRequest batchRequest,
  ) async {
    try {
      // Validate all requests first
      final validationResult = await validateBatchCreation(batchRequest);
      final validationResults = validationResult.fold(
        (failure) => <ValidationResult>[],
        (results) => results,
      );

      final invalidRequests = validationResults.where((result) => !result.isValid).toList();

      if (invalidRequests.isNotEmpty) {
        final invalidIds = invalidRequests.map((r) => r.proposalId).join(', ');
        return Left(
          PlaylistCreationFailure.invalidRequest(
            'Invalid requests for proposals: $invalidIds',
          ),
        );
      }

      final createdPlaylists = <Playlist>[];
      final errors = <String>[];

      // Create playlists sequentially to avoid rate limits
      for (final request in batchRequest.requests) {
        final result = await createPlaylist(request);

        result.fold(
          (failure) => errors.add('Failed to create ${request.playlistName}: $failure'),
          (playlist) => createdPlaylists.add(playlist),
        );

        // Add delay between requests to respect rate limits
        await Future.delayed(const Duration(milliseconds: 500));
      }

      if (errors.isNotEmpty && createdPlaylists.isEmpty) {
        return Left(
          PlaylistCreationFailure.serverError(
            'Failed to create any playlists: ${errors.join('; ')}',
          ),
        );
      }

      // Return successful playlists even if some failed
      return Right(createdPlaylists);
    } catch (e) {
      return Left(PlaylistCreationFailure.unknown('Batch creation error: $e'));
    }
  }

  @override
  Future<Either<PlaylistCreationFailure, bool>> validatePlaylistCreation(
    PlaylistCreationRequest request,
  ) async {
    try {
      final issues = <String>[];

      // Validate playlist name
      if (request.playlistName.trim().isEmpty) {
        issues.add('Playlist name cannot be empty');
      }

      if (request.playlistName.length > 100) {
        issues.add('Playlist name too long (max 100 characters)');
      }

      // Validate description
      if (request.description.length > 300) {
        issues.add('Description too long (max 300 characters)');
      }

      // Validate track count
      if (request.trackIds.isEmpty) {
        issues.add('Cannot create playlist without tracks');
      }

      if (request.trackIds.length > 10000) {
        issues.add('Too many tracks (max 10,000 per playlist)');
      }

      // Check for duplicate track IDs
      final uniqueTrackIds = request.trackIds.toSet();
      if (uniqueTrackIds.length != request.trackIds.length) {
        issues.add('Duplicate track IDs found');
      }

      // Validate track ID format (Spotify URIs)
      final invalidTrackIds = request.trackIds.where((id) => !_isValidSpotifyTrackId(id)).toList();

      if (invalidTrackIds.isNotEmpty) {
        issues.add('Invalid track IDs: ${invalidTrackIds.take(5).join(', ')}');
      }

      return Right(issues.isEmpty);
    } catch (e) {
      return Left(PlaylistCreationFailure.unknown('Validation error: $e'));
    }
  }

  @override
  Future<Either<PlaylistCreationFailure, List<ValidationResult>>> validateBatchCreation(
    BatchCreationRequest batchRequest,
  ) async {
    try {
      final results = <ValidationResult>[];

      for (final request in batchRequest.requests) {
        final validationResult = await validatePlaylistCreation(request);

        final result = validationResult.fold(
          (failure) => ValidationResult(
            proposalId: request.proposalId,
            isValid: false,
            issues: ['Validation failed: $failure'],
          ),
          (isValid) => ValidationResult(
            proposalId: request.proposalId,
            isValid: isValid,
            issues: isValid ? [] : ['Unknown validation issue'],
          ),
        );

        results.add(result);
      }

      // Additional batch-level validation
      final totalTracks = batchRequest.requests.expand((req) => req.trackIds).length;

      if (totalTracks > 50000) {
        // Mark all as invalid if batch is too large
        return Right(
          results
              .map(
                (r) => ValidationResult(
                  proposalId: r.proposalId,
                  isValid: false,
                  issues: [...r.issues, 'Batch too large (total tracks: $totalTracks)'],
                ),
              )
              .toList(),
        );
      }

      return Right(results);
    } catch (e) {
      return Left(PlaylistCreationFailure.unknown('Batch validation error: $e'));
    }
  }

  bool _isValidSpotifyTrackId(String trackId) {
    // Spotify track IDs are 22 characters long and contain only alphanumeric characters
    final regex = RegExp(r'^[a-zA-Z0-9]{22}$');
    return regex.hasMatch(trackId);
  }

  PlaylistCreationFailure _mapSpotifyFailure(dynamic spotifyFailure) {
    // This would map from SpotifyFailure to PlaylistCreationFailure
    // The exact mapping depends on how SpotifyFailure is defined
    final message = spotifyFailure.toString();

    if (message.contains('unauthorized') || message.contains('401')) {
      return PlaylistCreationFailure.unauthorized(message);
    }

    if (message.contains('forbidden') || message.contains('403')) {
      return PlaylistCreationFailure.forbidden(message);
    }

    if (message.contains('rate limit') || message.contains('429')) {
      return PlaylistCreationFailure.rateLimitExceeded(message);
    }

    if (message.contains('network') || message.contains('connection')) {
      return PlaylistCreationFailure.networkError(message);
    }

    if (message.contains('server') || message.contains('500')) {
      return PlaylistCreationFailure.serverError(message);
    }

    return PlaylistCreationFailure.unknown(message);
  }

  Playlist _mapSpotifyPlaylistToPlaylist(SpotifyPlaylist spotifyPlaylist) {
    return Playlist(
      id: spotifyPlaylist.id,
      name: spotifyPlaylist.name,
      description: spotifyPlaylist.description ?? '',
      ownerId: spotifyPlaylist.owner.id,
      ownerDisplayName: spotifyPlaylist.owner.displayName,
      isPublic: spotifyPlaylist.public,
      isCollaborative: spotifyPlaylist.collaborative,
      totalTracks: spotifyPlaylist.totalTracks,
      tracks: [], // Tracks will be populated separately if needed
      imageUrl: spotifyPlaylist.imageUrl,
      externalUrl: spotifyPlaylist.href,
      createdAt: DateTime.now(), // Spotify doesn't provide creation date
      modifiedAt: null, // Not available from basic playlist data
    );
  }
}
