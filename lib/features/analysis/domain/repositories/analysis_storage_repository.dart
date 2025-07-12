import 'package:fpdart/fpdart.dart';

import '../entities/analysis_statistics.dart';
import '../entities/song_analysis.dart';
import '../failures/storage_failure.dart';

abstract class AnalysisStorageRepository {
  /// Store a single song analysis
  Future<Either<StorageFailure, void>> storeSongAnalysis(SongAnalysis analysis);

  /// Store multiple song analyses
  Future<Either<StorageFailure, void>> storeSongAnalyses(List<SongAnalysis> analyses);

  /// Retrieve a song analysis by track ID
  Future<Either<StorageFailure, SongAnalysis?>> getSongAnalysis(String trackId);

  /// Retrieve multiple song analyses by track IDs
  Future<Either<StorageFailure, List<SongAnalysis>>> getSongAnalyses(List<String> trackIds);

  /// Get all stored song analyses
  Future<Either<StorageFailure, List<SongAnalysis>>> getAllSongAnalyses();

  /// Delete a song analysis by track ID
  Future<Either<StorageFailure, void>> deleteSongAnalysis(String trackId);

  /// Delete all stored song analyses
  Future<Either<StorageFailure, void>> clearAllAnalyses();

  /// Check if an analysis exists for a track ID
  Future<Either<StorageFailure, bool>> hasAnalysis(String trackId);

  /// Get analyses by mood
  Future<Either<StorageFailure, List<SongAnalysis>>> getAnalysesByMood(String mood);

  /// Get analyses by context
  Future<Either<StorageFailure, List<SongAnalysis>>> getAnalysesByContext(String context);

  /// Get analyses by style
  Future<Either<StorageFailure, List<SongAnalysis>>> getAnalysesByStyle(String style);

  /// Get analysis statistics
  Future<Either<StorageFailure, AnalysisStatistics>> getStatistics();
}
