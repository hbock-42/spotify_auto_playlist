import 'package:fpdart/fpdart.dart';
import '../entities/playlist_proposal.dart';
import '../entities/song_classification.dart';
import '../failures/proposal_failure.dart';
import 'song_grouping_service.dart';

class PlaylistProposalService {
  final SongGroupingService _groupingService;

  PlaylistProposalService({
    SongGroupingService? groupingService,
  }) : _groupingService = groupingService ?? SongGroupingService();

  Either<ProposalFailure, List<PlaylistProposal>> generateProposals(
    List<SongClassification> classifications, {
    ProposalGenerationOptions? options,
  }) {
    try {
      if (classifications.isEmpty) {
        return Left(ProposalFailure.insufficientData('No classifications provided'));
      }

      final opts = options ?? ProposalGenerationOptions.defaultOptions();

      final proposals = _groupingService.generateAllProposals(
        classifications,
        includePrimary: opts.includePrimaryCriteria,
        includeMultiCriteria: opts.includeMultiCriteria,
        includeSimilarity: opts.includeSimilarity,
        minGroupSize: opts.minPlaylistSize,
        maxGroupSize: opts.maxPlaylistSize,
      );

      if (proposals.isEmpty) {
        return Left(ProposalFailure.noValidGroups('Unable to create any valid playlist proposals'));
      }

      // Sort proposals by quality metrics
      final sortedProposals = _sortProposalsByQuality(proposals, opts.sortBy);

      // Limit number of proposals if specified
      final limitedProposals = opts.maxProposals != null
          ? sortedProposals.take(opts.maxProposals!).toList()
          : sortedProposals;

      return Right(limitedProposals);
    } catch (e) {
      return Left(ProposalFailure.processingError('Error generating proposals: $e'));
    }
  }

  Either<ProposalFailure, List<PlaylistProposal>> selectProposals(
    List<PlaylistProposal> proposals,
    List<String> selectedIds,
  ) {
    try {
      if (selectedIds.isEmpty) {
        return Left(ProposalFailure.invalidSelection('No proposals selected'));
      }

      final selectedProposals = <PlaylistProposal>[];
      final missingIds = <String>[];

      for (final id in selectedIds) {
        final proposal = proposals.firstWhere(
          (p) => p.id == id,
          orElse: () => throw StateError('Proposal not found'),
        );
        
        try {
          selectedProposals.add(proposal.copyWith(isSelected: true));
        } catch (e) {
          missingIds.add(id);
        }
      }

      if (missingIds.isNotEmpty) {
        return Left(ProposalFailure.invalidSelection(
          'Proposals not found: ${missingIds.join(', ')}',
        ));
      }

      return Right(selectedProposals);
    } catch (e) {
      return Left(ProposalFailure.processingError('Error selecting proposals: $e'));
    }
  }

  Either<ProposalFailure, List<PlaylistCreationRequest>> createBatchRequest(
    List<PlaylistProposal> selectedProposals, {
    BatchCreationOptions? options,
  }) {
    try {
      if (selectedProposals.isEmpty) {
        return Left(ProposalFailure.invalidSelection('No proposals provided'));
      }

      final opts = options ?? BatchCreationOptions.defaultOptions();
      final requests = <PlaylistCreationRequest>[];

      for (final proposal in selectedProposals) {
        if (!proposal.isSelected) continue;

        final trackIds = proposal.songs.map((s) => s.trackId).toList();
        
        if (trackIds.length < opts.minTracksPerPlaylist) {
          continue; // Skip proposals with insufficient tracks
        }

        final request = PlaylistCreationRequest(
          proposalId: proposal.id,
          playlistName: opts.useCustomNames 
              ? _generateCustomName(proposal, opts) 
              : proposal.suggestedName,
          description: _enhanceDescription(proposal, opts),
          isPublic: opts.makePlaylistsPublic,
          trackIds: trackIds.take(opts.maxTracksPerPlaylist).toList(),
          metadata: {
            'proposal_id': proposal.id,
            'criteria': proposal.criteria,
            'strategy': proposal.metadata.strategy.name,
            'cohesion_score': proposal.metadata.cohesionScore,
            'created_by': 'spotify_auto_playlist',
            'creation_options': opts.toJson(),
          },
        );

        requests.add(request);
      }

      if (requests.isEmpty) {
        return Left(ProposalFailure.noValidGroups('No valid creation requests generated'));
      }

      return Right(requests);
    } catch (e) {
      return Left(ProposalFailure.processingError('Error creating batch request: $e'));
    }
  }

  Either<ProposalFailure, BatchCreationRequest> prepareBatchCreation(
    List<PlaylistProposal> selectedProposals,
    String userId, {
    BatchCreationOptions? options,
  }) {
    try {
      final requestsResult = createBatchRequest(selectedProposals, options: options);
      
      return requestsResult.fold(
        (failure) => Left(failure),
        (requests) {
          final batchRequest = BatchCreationRequest(
            requests: requests,
            userId: userId,
            requestedAt: DateTime.now(),
            options: (options ?? BatchCreationOptions.defaultOptions()).toJson(),
          );

          return Right(batchRequest);
        },
      );
    } catch (e) {
      return Left(ProposalFailure.processingError('Error preparing batch creation: $e'));
    }
  }

  List<PlaylistProposal> _sortProposalsByQuality(
    List<PlaylistProposal> proposals,
    ProposalSortBy sortBy,
  ) {
    final sorted = List<PlaylistProposal>.from(proposals);

    sorted.sort((a, b) {
      return switch (sortBy) {
        ProposalSortBy.cohesionScore => 
          b.metadata.cohesionScore.compareTo(a.metadata.cohesionScore),
        ProposalSortBy.songCount => 
          b.songCount.compareTo(a.songCount),
        ProposalSortBy.averageConfidence => 
          b.averageConfidence.compareTo(a.averageConfidence),
        ProposalSortBy.criteriaSpecificity => 
          a.criteria.length.compareTo(b.criteria.length), // Fewer criteria = more specific
        ProposalSortBy.optimal => 
          _calculateOverallScore(b).compareTo(_calculateOverallScore(a)),
      };
    });

    return sorted;
  }

  double _calculateOverallScore(PlaylistProposal proposal) {
    // Weighted scoring algorithm
    const cohesionWeight = 0.4;
    const confidenceWeight = 0.3;
    const sizeWeight = 0.2;
    const specificityWeight = 0.1;

    final cohesionScore = proposal.metadata.cohesionScore;
    final confidenceScore = proposal.averageConfidence;
    final sizeScore = _calculateSizeScore(proposal.songCount);
    final specificityScore = _calculateSpecificityScore(proposal.criteria.length);

    return (cohesionScore * cohesionWeight) +
           (confidenceScore * confidenceWeight) +
           (sizeScore * sizeWeight) +
           (specificityScore * specificityWeight);
  }

  double _calculateSizeScore(int songCount) {
    const optimal = 30;
    const min = 10;
    const max = 100;

    if (songCount < min || songCount > max) return 0.0;
    if (songCount == optimal) return 1.0;

    final distance = (songCount - optimal).abs();
    final maxDistance = optimal - min;
    
    return 1.0 - (distance / maxDistance).clamp(0.0, 1.0);
  }

  double _calculateSpecificityScore(int criteriaCount) {
    // Prefer single criteria (most specific) or dual criteria
    return switch (criteriaCount) {
      1 => 1.0,
      2 => 0.8,
      3 => 0.6,
      _ => 0.4,
    };
  }

  String _generateCustomName(PlaylistProposal proposal, BatchCreationOptions options) {
    if (options.customNamePrefix.isNotEmpty) {
      return '${options.customNamePrefix}${proposal.formattedName}';
    }
    return proposal.formattedName;
  }

  String _enhanceDescription(PlaylistProposal proposal, BatchCreationOptions options) {
    final baseDescription = proposal.description;
    
    if (options.includeGenerationInfo) {
      final enhancedDescription = '$baseDescription\n\n'
          'Generated automatically by Spotify Auto Playlist.\n'
          'Cohesion Score: ${(proposal.metadata.cohesionScore * 100).toStringAsFixed(1)}%\n'
          'Average Confidence: ${(proposal.averageConfidence * 100).toStringAsFixed(1)}%';
      
      return enhancedDescription;
    }
    
    return baseDescription;
  }
}

class ProposalGenerationOptions {
  final bool includePrimaryCriteria;
  final bool includeMultiCriteria;
  final bool includeSimilarity;
  final int minPlaylistSize;
  final int maxPlaylistSize;
  final int? maxProposals;
  final ProposalSortBy sortBy;

  const ProposalGenerationOptions({
    this.includePrimaryCriteria = true,
    this.includeMultiCriteria = true,
    this.includeSimilarity = false,
    this.minPlaylistSize = 10,
    this.maxPlaylistSize = 100,
    this.maxProposals,
    this.sortBy = ProposalSortBy.optimal,
  });

  factory ProposalGenerationOptions.defaultOptions() {
    return const ProposalGenerationOptions();
  }

  factory ProposalGenerationOptions.conservative() {
    return const ProposalGenerationOptions(
      includePrimaryCriteria: true,
      includeMultiCriteria: false,
      includeSimilarity: false,
      minPlaylistSize: 15,
      maxPlaylistSize: 50,
      maxProposals: 10,
      sortBy: ProposalSortBy.cohesionScore,
    );
  }

  factory ProposalGenerationOptions.comprehensive() {
    return const ProposalGenerationOptions(
      includePrimaryCriteria: true,
      includeMultiCriteria: true,
      includeSimilarity: true,
      minPlaylistSize: 8,
      maxPlaylistSize: 150,
      sortBy: ProposalSortBy.optimal,
    );
  }
}

class BatchCreationOptions {
  final bool makePlaylistsPublic;
  final bool useCustomNames;
  final String customNamePrefix;
  final bool includeGenerationInfo;
  final int minTracksPerPlaylist;
  final int maxTracksPerPlaylist;

  const BatchCreationOptions({
    this.makePlaylistsPublic = false,
    this.useCustomNames = false,
    this.customNamePrefix = '',
    this.includeGenerationInfo = true,
    this.minTracksPerPlaylist = 10,
    this.maxTracksPerPlaylist = 100,
  });

  factory BatchCreationOptions.defaultOptions() {
    return const BatchCreationOptions();
  }

  Map<String, dynamic> toJson() {
    return {
      'make_playlists_public': makePlaylistsPublic,
      'use_custom_names': useCustomNames,
      'custom_name_prefix': customNamePrefix,
      'include_generation_info': includeGenerationInfo,
      'min_tracks_per_playlist': minTracksPerPlaylist,
      'max_tracks_per_playlist': maxTracksPerPlaylist,
    };
  }
}

enum ProposalSortBy {
  cohesionScore,
  songCount,
  averageConfidence,
  criteriaSpecificity,
  optimal,
}