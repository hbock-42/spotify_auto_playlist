import 'package:fpdart/fpdart.dart';
import '../entities/playlist_proposal.dart';
import '../entities/playlist.dart';
import '../failures/playlist_creation_failure.dart';

abstract interface class PlaylistCreationRepository {
  Future<Either<PlaylistCreationFailure, Playlist>> createPlaylist(
    PlaylistCreationRequest request,
  );

  Future<Either<PlaylistCreationFailure, List<Playlist>>> createPlaylists(
    BatchCreationRequest batchRequest,
  );

  Future<Either<PlaylistCreationFailure, bool>> validatePlaylistCreation(
    PlaylistCreationRequest request,
  );

  Future<Either<PlaylistCreationFailure, List<ValidationResult>>> validateBatchCreation(
    BatchCreationRequest batchRequest,
  );
}

class ValidationResult {
  final String proposalId;
  final bool isValid;
  final List<String> issues;

  const ValidationResult({
    required this.proposalId,
    required this.isValid,
    required this.issues,
  });
}