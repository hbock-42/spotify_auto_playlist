import '../entities/song_classification.dart';
import '../entities/playlist_proposal.dart';

class SongGroupingService {
  static const int _minPlaylistSize = 10;
  static const int _maxPlaylistSize = 100;
  static const int _optimalPlaylistSize = 30;

  List<PlaylistProposal> groupByPrimaryCriteria(
    List<SongClassification> classifications, {
    ClassificationCategory category = ClassificationCategory.mood,
    int minGroupSize = _minPlaylistSize,
    int maxGroupSize = _maxPlaylistSize,
  }) {
    final groups = <String, List<SongClassification>>{};

    for (final classification in classifications) {
      final primaryCategory = _getPrimaryCategory(classification, category);
      if (primaryCategory.isNotEmpty) {
        groups.putIfAbsent(primaryCategory, () => []).add(classification);
      }
    }

    return groups.entries
        .where((entry) => entry.value.length >= minGroupSize)
        .map((entry) => _createProposal(
              criteria: [entry.key],
              songs: _limitGroupSize(entry.value, maxGroupSize),
              strategy: GroupingStrategy.singleCriteria,
            ))
        .toList();
  }

  List<PlaylistProposal> groupByMultipleCriteria(
    List<SongClassification> classifications, {
    int minGroupSize = _minPlaylistSize,
    int maxGroupSize = _maxPlaylistSize,
    double similarityThreshold = 0.6,
  }) {
    final proposals = <PlaylistProposal>[];

    // Group by mood + context combinations
    final moodContextGroups = _groupByMultipleCategoriesInternal(
      classifications,
      [ClassificationCategory.mood, ClassificationCategory.context],
      minGroupSize,
      maxGroupSize,
    );
    proposals.addAll(moodContextGroups);

    // Group by mood + style combinations
    final moodStyleGroups = _groupByMultipleCategoriesInternal(
      classifications,
      [ClassificationCategory.mood, ClassificationCategory.style],
      minGroupSize,
      maxGroupSize,
    );
    proposals.addAll(moodStyleGroups);

    // Group by context + style combinations
    final contextStyleGroups = _groupByMultipleCategoriesInternal(
      classifications,
      [ClassificationCategory.context, ClassificationCategory.style],
      minGroupSize,
      maxGroupSize,
    );
    proposals.addAll(contextStyleGroups);

    return proposals;
  }

  List<PlaylistProposal> groupBySimilarity(
    List<SongClassification> classifications, {
    double similarityThreshold = 0.7,
    int minGroupSize = _minPlaylistSize,
    int maxGroupSize = _maxPlaylistSize,
  }) {
    final proposals = <PlaylistProposal>[];
    final processed = <String>{};

    for (final classification in classifications) {
      if (processed.contains(classification.trackId)) continue;

      final similarSongs = _findSimilarSongs(
        classification,
        classifications,
        similarityThreshold,
      );

      if (similarSongs.length >= minGroupSize) {
        final limitedSongs = _limitGroupSize(similarSongs, maxGroupSize);
        final commonCategories = _findCommonCategories(limitedSongs);

        proposals.add(_createProposal(
          criteria: commonCategories,
          songs: limitedSongs,
          strategy: GroupingStrategy.similarity,
        ));

        processed.addAll(limitedSongs.map((s) => s.trackId));
      }
    }

    return proposals;
  }

  List<PlaylistProposal> generateAllProposals(
    List<SongClassification> classifications, {
    bool includePrimary = true,
    bool includeMultiCriteria = true,
    bool includeSimilarity = false,
    int minGroupSize = _minPlaylistSize,
    int maxGroupSize = _maxPlaylistSize,
  }) {
    final proposals = <PlaylistProposal>[];

    if (includePrimary) {
      // Group by each category type
      for (final category in ClassificationCategory.values) {
        final categoryProposals = groupByPrimaryCriteria(
          classifications,
          category: category,
          minGroupSize: minGroupSize,
          maxGroupSize: maxGroupSize,
        );
        proposals.addAll(categoryProposals);
      }
    }

    if (includeMultiCriteria) {
      final multiProposals = groupByMultipleCriteria(
        classifications,
        minGroupSize: minGroupSize,
        maxGroupSize: maxGroupSize,
      );
      proposals.addAll(multiProposals);
    }

    if (includeSimilarity) {
      final similarityProposals = groupBySimilarity(
        classifications,
        minGroupSize: minGroupSize,
        maxGroupSize: maxGroupSize,
      );
      proposals.addAll(similarityProposals);
    }

    return _deduplicate(proposals);
  }

  String _getPrimaryCategory(
    SongClassification classification,
    ClassificationCategory category,
  ) {
    return switch (category) {
      ClassificationCategory.mood => classification.primaryMood,
      ClassificationCategory.context => classification.primaryContext,
      ClassificationCategory.style => classification.primaryStyle,
    };
  }

  List<PlaylistProposal> _groupByMultipleCategoriesInternal(
    List<SongClassification> classifications,
    List<ClassificationCategory> categories,
    int minGroupSize,
    int maxGroupSize,
  ) {
    final groups = <String, List<SongClassification>>{};

    for (final classification in classifications) {
      final categoryValues = categories
          .map((cat) => _getPrimaryCategory(classification, cat))
          .where((val) => val.isNotEmpty)
          .toList();

      if (categoryValues.length == categories.length) {
        final key = categoryValues.join(' + ');
        groups.putIfAbsent(key, () => []).add(classification);
      }
    }

    return groups.entries
        .where((entry) => entry.value.length >= minGroupSize)
        .map((entry) => _createProposal(
              criteria: entry.key.split(' + '),
              songs: _limitGroupSize(entry.value, maxGroupSize),
              strategy: GroupingStrategy.multiCriteria,
            ))
        .toList();
  }

  List<SongClassification> _findSimilarSongs(
    SongClassification target,
    List<SongClassification> all,
    double threshold,
  ) {
    final similar = <SongClassification>[];

    for (final song in all) {
      if (song.trackId == target.trackId) {
        similar.add(song);
        continue;
      }

      final similarity = _calculateSimilarity(target, song);
      if (similarity >= threshold) {
        similar.add(song);
      }
    }

    return similar;
  }

  double _calculateSimilarity(SongClassification a, SongClassification b) {
    final allCategoriesA = a.getAllCategories().toSet();
    final allCategoriesB = b.getAllCategories().toSet();

    if (allCategoriesA.isEmpty && allCategoriesB.isEmpty) return 1.0;
    if (allCategoriesA.isEmpty || allCategoriesB.isEmpty) return 0.0;

    final intersection = allCategoriesA.intersection(allCategoriesB);
    final union = allCategoriesA.union(allCategoriesB);

    return intersection.length / union.length;
  }

  List<String> _findCommonCategories(List<SongClassification> songs) {
    if (songs.isEmpty) return [];

    final commonCategories = songs.first.getAllCategories().toSet();

    for (final song in songs.skip(1)) {
      final songCategories = song.getAllCategories().toSet();
      commonCategories.retainWhere((cat) => songCategories.contains(cat));
    }

    return commonCategories.toList();
  }

  List<SongClassification> _limitGroupSize(
    List<SongClassification> songs,
    int maxSize,
  ) {
    if (songs.length <= maxSize) return songs;

    // Sort by confidence and take top songs
    final sorted = List<SongClassification>.from(songs)
      ..sort((a, b) => b.confidence.compareTo(a.confidence));

    return sorted.take(maxSize).toList();
  }

  PlaylistProposal _createProposal({
    required List<String> criteria,
    required List<SongClassification> songs,
    required GroupingStrategy strategy,
  }) {
    final now = DateTime.now();
    final proposalId = '${now.millisecondsSinceEpoch}_${criteria.join('_')}';

    final metadata = ProposalMetadata(
      strategy: strategy,
      primaryCriteria: criteria,
      secondaryCriteria: [],
      cohesionScore: _calculateCohesionScore(songs),
      estimatedDuration: Duration(minutes: songs.length * 3), // ~3min per song
      optimalSize: _optimalPlaylistSize,
      actualSize: songs.length,
      groupingParameters: {
        'strategy': strategy.name,
        'criteria_count': criteria.length,
        'song_count': songs.length,
      },
    );

    final suggestedName = criteria.length == 1
        ? 'auto[${criteria.first}]'
        : 'auto[${criteria.join(' | ')}]';

    final description = _generateDescription(criteria, songs.length, strategy);

    return PlaylistProposal(
      id: proposalId,
      suggestedName: suggestedName,
      description: description,
      criteria: criteria,
      songs: songs,
      metadata: metadata,
      createdAt: now,
      isSelected: false,
    );
  }

  double _calculateCohesionScore(List<SongClassification> songs) {
    if (songs.length < 2) return 1.0;

    double totalSimilarity = 0.0;
    int comparisons = 0;

    for (int i = 0; i < songs.length; i++) {
      for (int j = i + 1; j < songs.length; j++) {
        totalSimilarity += _calculateSimilarity(songs[i], songs[j]);
        comparisons++;
      }
    }

    return comparisons > 0 ? totalSimilarity / comparisons : 0.0;
  }

  String _generateDescription(
    List<String> criteria,
    int songCount,
    GroupingStrategy strategy,
  ) {
    final strategyText = switch (strategy) {
      GroupingStrategy.singleCriteria => 'Songs grouped by ${criteria.first}',
      GroupingStrategy.multiCriteria => 'Songs matching ${criteria.join(' and ')}',
      GroupingStrategy.similarity => 'Similar songs with ${criteria.join(', ')} characteristics',
      GroupingStrategy.hybrid => 'Curated selection based on ${criteria.join(', ')}',
    };

    return '$strategyText. Contains $songCount tracks.';
  }

  List<PlaylistProposal> _deduplicate(List<PlaylistProposal> proposals) {
    final seen = <Set<String>>{};
    final unique = <PlaylistProposal>[];

    for (final proposal in proposals) {
      final trackIds = proposal.songs.map((s) => s.trackId).toSet();
      
      // Check if we've seen this exact set of tracks before
      bool isDuplicate = false;
      for (final seenSet in seen) {
        if (seenSet.length == trackIds.length && 
            seenSet.containsAll(trackIds)) {
          isDuplicate = true;
          break;
        }
      }

      if (!isDuplicate) {
        seen.add(trackIds);
        unique.add(proposal);
      }
    }

    return unique;
  }
}