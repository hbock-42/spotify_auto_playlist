import 'package:freezed_annotation/freezed_annotation.dart';
import 'song_classification.dart';

part 'playlist_proposal.freezed.dart';
part 'playlist_proposal.g.dart';

@freezed
abstract class PlaylistProposal with _$PlaylistProposal {
  const factory PlaylistProposal({
    required String id,
    required String suggestedName,
    required String description,
    required List<String> criteria,
    required List<SongClassification> songs,
    required ProposalMetadata metadata,
    required DateTime createdAt,
    required bool isSelected,
  }) = _PlaylistProposal;

  factory PlaylistProposal.fromJson(Map<String, dynamic> json) => _$PlaylistProposalFromJson(json);

  const PlaylistProposal._();

  int get songCount => songs.length;
  
  double get averageConfidence {
    if (songs.isEmpty) return 0.0;
    return songs.map((s) => s.confidence).reduce((a, b) => a + b) / songs.length;
  }

  Duration get totalDuration {
    // Assuming we can get duration from metadata or calculate it
    return metadata.estimatedDuration;
  }

  String get formattedName {
    if (criteria.length == 1) {
      return 'auto[${criteria.first}]';
    } else if (criteria.length > 1) {
      return 'auto[${criteria.join(' | ')}]';
    }
    return 'auto[mixed]';
  }

  Map<String, int> get categoryDistribution {
    final distribution = <String, int>{};
    for (final song in songs) {
      for (final category in song.getAllCategories()) {
        distribution[category] = (distribution[category] ?? 0) + 1;
      }
    }
    return distribution;
  }
}

@freezed
abstract class ProposalMetadata with _$ProposalMetadata {
  const factory ProposalMetadata({
    required GroupingStrategy strategy,
    required List<String> primaryCriteria,
    required List<String> secondaryCriteria,
    required double cohesionScore,
    required Duration estimatedDuration,
    required int optimalSize,
    required int actualSize,
    required Map<String, dynamic> groupingParameters,
  }) = _ProposalMetadata;

  factory ProposalMetadata.fromJson(Map<String, dynamic> json) => _$ProposalMetadataFromJson(json);
}

enum GroupingStrategy {
  singleCriteria,
  multiCriteria,
  hybrid,
  similarity,
}

@freezed
abstract class PlaylistCreationRequest with _$PlaylistCreationRequest {
  const factory PlaylistCreationRequest({
    required String proposalId,
    required String playlistName,
    required String description,
    required bool isPublic,
    required List<String> trackIds,
    required Map<String, dynamic> metadata,
  }) = _PlaylistCreationRequest;

  factory PlaylistCreationRequest.fromJson(Map<String, dynamic> json) => _$PlaylistCreationRequestFromJson(json);
}

@freezed
abstract class BatchCreationRequest with _$BatchCreationRequest {
  const factory BatchCreationRequest({
    required List<PlaylistCreationRequest> requests,
    required String userId,
    required DateTime requestedAt,
    required Map<String, dynamic> options,
  }) = _BatchCreationRequest;

  factory BatchCreationRequest.fromJson(Map<String, dynamic> json) => _$BatchCreationRequestFromJson(json);
}