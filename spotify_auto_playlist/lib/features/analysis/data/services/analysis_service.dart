import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

import '../../../spotify/domain/entities/spotify_track.dart';
import '../../../spotify/domain/failures/spotify_failure.dart';
import '../../../spotify/domain/repositories/spotify_repository.dart';
import '../../domain/entities/batch_analysis_progress.dart';
import '../../domain/entities/song_analysis.dart';
import '../../domain/failures/analysis_failure.dart';
import '../../domain/failures/llm_failure.dart';
import '../../domain/repositories/llm_repository.dart';

class AnalysisService {
  final SpotifyRepository _spotifyRepository;
  final LlmRepository _llmRepository;
  final Logger _logger;

  AnalysisService({
    required SpotifyRepository spotifyRepository,
    required LlmRepository llmRepository,
    required Logger logger,
  })  : _spotifyRepository = spotifyRepository,
        _llmRepository = llmRepository,
        _logger = logger;

  Future<Either<AnalysisFailure, Stream<BatchAnalysisProgress>>> analyzePlaylist(
    String playlistId, {
    int concurrency = 3,
    Duration? delay,
  }) async {
    try {
      // First, fetch all tracks from the playlist
      final tracksResult = await _getAllPlaylistTracks(playlistId);
      
      return tracksResult.fold(
        (failure) => Left(AnalysisFailure.spotifyError(failure.message)),
        (tracks) async {
          if (tracks.isEmpty) {
            return Left(const AnalysisFailure.emptyPlaylist());
          }

          // Get audio features for all tracks
          final audioFeaturesResult = await _getAudioFeaturesForTracks(tracks);
          
          return audioFeaturesResult.fold(
            (failure) => Left(AnalysisFailure.spotifyError(failure.message)),
            (audioFeatures) {
              // Create the analysis stream
              final stream = _createAnalysisStream(
                tracks,
                audioFeatures,
                concurrency: concurrency,
                delay: delay,
              );
              
              return Right(stream);
            },
          );
        },
      );
    } catch (e) {
      _logger.e('Unexpected error in analyzePlaylist: $e');
      return Left(AnalysisFailure.unknown(e.toString()));
    }
  }

  Future<Either<SpotifyFailure, List<SpotifyTrack>>> _getAllPlaylistTracks(String playlistId) async {
    final allTracks = <SpotifyTrack>[];
    int offset = 0;
    const limit = 50;
    
    while (true) {
      final result = await _spotifyRepository.getPlaylistTracks(
        playlistId,
        limit: limit,
        offset: offset,
      );
      
      if (result.isLeft()) {
        return result;
      }
      
      final tracks = result.fold(
        (failure) => <SpotifyTrack>[], // Won't be reached due to isLeft check
        (tracks) => tracks,
      );
      
      allTracks.addAll(tracks);
      
      // If we got fewer tracks than the limit, we've reached the end
      if (tracks.length < limit) {
        break;
      }
      
      offset += limit;
    }
    
    return Right(allTracks);
  }

  Future<Either<SpotifyFailure, Map<String, Map<String, dynamic>>>> _getAudioFeaturesForTracks(
    List<SpotifyTrack> tracks,
  ) async {
    final trackIds = tracks.map((t) => t.id).toList();
    final audioFeaturesMap = <String, Map<String, dynamic>>{};
    
    // Spotify allows up to 100 track IDs per request
    const batchSize = 100;
    
    for (int i = 0; i < trackIds.length; i += batchSize) {
      final batch = trackIds.skip(i).take(batchSize).toList();
      
      final result = await _spotifyRepository.getAudioFeatures(batch);
      
      if (result.isLeft()) {
        return result.fold(
          (failure) => Left(failure),
          (_) => Right({}), // Won't be reached
        );
      }
      
      final data = result.fold(
        (failure) => <String, dynamic>{}, // Won't be reached due to isLeft check
        (data) => data,
      );
      
      final features = data['audio_features'] as List<dynamic>;
      for (final feature in features) {
        if (feature != null) {
          final featureMap = feature as Map<String, dynamic>;
          final trackId = featureMap['id'] as String;
          audioFeaturesMap[trackId] = featureMap;
        }
      }
    }
    
    return Right(audioFeaturesMap);
  }

  Stream<BatchAnalysisProgress> _createAnalysisStream(
    List<SpotifyTrack> tracks,
    Map<String, Map<String, dynamic>> audioFeatures, {
    required int concurrency,
    Duration? delay,
  }) async* {
    final totalSongs = tracks.length;
    final completedAnalyses = <SongAnalysis>[];
    final failedSongTitles = <String>[];
    
    // Initial progress
    yield BatchAnalysisProgress(
      totalSongs: totalSongs,
      completedSongs: 0,
      failedSongs: 0,
      completedAnalyses: [],
      failedSongTitles: [],
      currentSongTitle: 'Preparing analysis...',
    );

    // Create song metadata for LLM analysis
    final songMetadata = tracks.map((track) {
      final features = audioFeatures[track.id];
      
      return SongMetadata(
        title: track.name,
        artist: track.artists.first.name,
        genres: [], // Spotify track response doesn't include genres
        energy: features?['energy']?.toDouble() ?? 0.5,
        danceability: features?['danceability']?.toDouble() ?? 0.5,
        valence: features?['valence']?.toDouble() ?? 0.5,
        tempo: features?['tempo']?.toDouble() ?? 120.0,
        acousticness: features?['acousticness']?.toDouble() ?? 0.5,
      );
    }).toList();

    // Process songs sequentially to emit progress updates
    for (int i = 0; i < songMetadata.length; i++) {
      final metadata = songMetadata[i];
      
      // Update current song
      yield BatchAnalysisProgress(
        totalSongs: totalSongs,
        completedSongs: i,
        failedSongs: failedSongTitles.length,
        completedAnalyses: [...completedAnalyses],
        failedSongTitles: [...failedSongTitles],
        currentSongTitle: '${metadata.title} by ${metadata.artist}',
      );
      
      // Add delay if specified
      if (delay != null && i > 0) {
        await Future.delayed(delay);
      }
      
      // Analyze the song
      final result = await _llmRepository.analyzeSong(metadata);
      
      result.fold(
        (failure) {
          _logger.w('Failed to analyze "${metadata.title}": ${failure.message}');
          failedSongTitles.add('${metadata.title} by ${metadata.artist}');
        },
        (analysis) {
          completedAnalyses.add(analysis);
        },
      );
      
      // Emit progress update after each song
      yield BatchAnalysisProgress(
        totalSongs: totalSongs,
        completedSongs: i + 1,
        failedSongs: failedSongTitles.length,
        completedAnalyses: [...completedAnalyses],
        failedSongTitles: [...failedSongTitles],
        currentSongTitle: i + 1 < totalSongs 
            ? 'Processing next song...' 
            : 'Analysis complete!',
      );
    }
    
    // Final progress with completion flag
    yield BatchAnalysisProgress(
      totalSongs: totalSongs,
      completedSongs: songMetadata.length,
      failedSongs: failedSongTitles.length,
      completedAnalyses: completedAnalyses,
      failedSongTitles: failedSongTitles,
      currentSongTitle: 'Analysis complete!',
      isCompleted: true,
    );
  }
}