import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/analysis_statistics.dart';
import '../../domain/entities/song_analysis.dart';
import '../../domain/failures/storage_failure.dart';
import '../../domain/repositories/analysis_storage_repository.dart';

class AnalysisStorageRepositoryImpl implements AnalysisStorageRepository {
  static const String _storageKey = 'song_analyses';
  
  @override
  Future<Either<StorageFailure, void>> storeSongAnalysis(SongAnalysis analysis) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final existing = await _getAllAnalysesMap();
      
      existing[analysis.trackId] = analysis.toJson();
      
      final success = await prefs.setString(_storageKey, jsonEncode(existing));
      
      if (success) {
        return const Right(null);
      } else {
        return Left(StorageFailure.writeError('Failed to store song analysis'));
      }
    } catch (e) {
      return Left(StorageFailure.unknown('Unexpected error storing analysis: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, void>> storeSongAnalyses(List<SongAnalysis> analyses) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final existing = await _getAllAnalysesMap();
      
      for (final analysis in analyses) {
        existing[analysis.trackId] = analysis.toJson();
      }
      
      final success = await prefs.setString(_storageKey, jsonEncode(existing));
      
      if (success) {
        return const Right(null);
      } else {
        return Left(StorageFailure.writeError('Failed to store song analyses'));
      }
    } catch (e) {
      return Left(StorageFailure.unknown('Unexpected error storing analyses: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, SongAnalysis?>> getSongAnalysis(String trackId) async {
    try {
      final analyses = await _getAllAnalysesMap();
      final analysisJson = analyses[trackId];
      
      if (analysisJson == null) {
        return const Right(null);
      }
      
      final analysis = SongAnalysis.fromJson(analysisJson as Map<String, dynamic>);
      return Right(analysis);
    } catch (e) {
      return Left(StorageFailure.readError('Failed to read song analysis: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, List<SongAnalysis>>> getSongAnalyses(List<String> trackIds) async {
    try {
      final analyses = await _getAllAnalysesMap();
      final results = <SongAnalysis>[];
      
      for (final trackId in trackIds) {
        final analysisJson = analyses[trackId];
        if (analysisJson != null) {
          final analysis = SongAnalysis.fromJson(analysisJson as Map<String, dynamic>);
          results.add(analysis);
        }
      }
      
      return Right(results);
    } catch (e) {
      return Left(StorageFailure.readError('Failed to read song analyses: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, List<SongAnalysis>>> getAllSongAnalyses() async {
    try {
      final analyses = await _getAllAnalysesMap();
      final results = <SongAnalysis>[];
      
      for (final analysisJson in analyses.values) {
        final analysis = SongAnalysis.fromJson(analysisJson as Map<String, dynamic>);
        results.add(analysis);
      }
      
      return Right(results);
    } catch (e) {
      return Left(StorageFailure.readError('Failed to read all song analyses: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, void>> deleteSongAnalysis(String trackId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final existing = await _getAllAnalysesMap();
      
      existing.remove(trackId);
      
      final success = await prefs.setString(_storageKey, jsonEncode(existing));
      
      if (success) {
        return const Right(null);
      } else {
        return Left(StorageFailure.writeError('Failed to delete song analysis'));
      }
    } catch (e) {
      return Left(StorageFailure.unknown('Unexpected error deleting analysis: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, void>> clearAllAnalyses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final success = await prefs.remove(_storageKey);
      
      if (success) {
        return const Right(null);
      } else {
        return Left(StorageFailure.writeError('Failed to clear all analyses'));
      }
    } catch (e) {
      return Left(StorageFailure.unknown('Unexpected error clearing analyses: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, bool>> hasAnalysis(String trackId) async {
    try {
      final analyses = await _getAllAnalysesMap();
      return Right(analyses.containsKey(trackId));
    } catch (e) {
      return Left(StorageFailure.readError('Failed to check analysis existence: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, List<SongAnalysis>>> getAnalysesByMood(String mood) async {
    return _getAnalysesByCategory('moods', mood);
  }

  @override
  Future<Either<StorageFailure, List<SongAnalysis>>> getAnalysesByContext(String context) async {
    return _getAnalysesByCategory('contexts', context);
  }

  @override
  Future<Either<StorageFailure, List<SongAnalysis>>> getAnalysesByStyle(String style) async {
    return _getAnalysesByCategory('styles', style);
  }

  Future<Either<StorageFailure, List<SongAnalysis>>> _getAnalysesByCategory(String category, String value) async {
    try {
      final allAnalyses = await getAllSongAnalyses();
      
      return allAnalyses.fold(
        (failure) => Left(failure),
        (analyses) {
          final filtered = analyses.where((analysis) {
            switch (category) {
              case 'moods':
                return analysis.moods.contains(value);
              case 'contexts':
                return analysis.contexts.contains(value);
              case 'styles':
                return analysis.styles.contains(value);
              default:
                return false;
            }
          }).toList();
          
          return Right(filtered);
        },
      );
    } catch (e) {
      return Left(StorageFailure.readError('Failed to filter analyses by $category: $e'));
    }
  }

  @override
  Future<Either<StorageFailure, AnalysisStatistics>> getStatistics() async {
    try {
      final allAnalyses = await getAllSongAnalyses();
      
      return allAnalyses.fold(
        (failure) => Left(failure),
        (analyses) {
          if (analyses.isEmpty) {
            return Right(AnalysisStatistics(
              totalAnalyses: 0,
              moodCounts: {},
              contextCounts: {},
              styleCounts: {},
              averageConfidence: 0.0,
              lastAnalyzedAt: null,
              firstAnalyzedAt: null,
            ));
          }
          
          final moodCounts = <String, int>{};
          final contextCounts = <String, int>{};
          final styleCounts = <String, int>{};
          double totalConfidence = 0.0;
          
          DateTime? earliest;
          DateTime? latest;
          
          for (final analysis in analyses) {
            // Count moods
            for (final mood in analysis.moods) {
              moodCounts[mood] = (moodCounts[mood] ?? 0) + 1;
            }
            
            // Count contexts
            for (final context in analysis.contexts) {
              contextCounts[context] = (contextCounts[context] ?? 0) + 1;
            }
            
            // Count styles
            for (final style in analysis.styles) {
              styleCounts[style] = (styleCounts[style] ?? 0) + 1;
            }
            
            totalConfidence += analysis.confidence;
            
            // Track dates
            if (earliest == null || analysis.analyzedAt.isBefore(earliest)) {
              earliest = analysis.analyzedAt;
            }
            if (latest == null || analysis.analyzedAt.isAfter(latest)) {
              latest = analysis.analyzedAt;
            }
          }
          
          return Right(AnalysisStatistics(
            totalAnalyses: analyses.length,
            moodCounts: moodCounts,
            contextCounts: contextCounts,
            styleCounts: styleCounts,
            averageConfidence: totalConfidence / analyses.length,
            firstAnalyzedAt: earliest,
            lastAnalyzedAt: latest,
          ));
        },
      );
    } catch (e) {
      return Left(StorageFailure.readError('Failed to calculate statistics: $e'));
    }
  }

  Future<Map<String, dynamic>> _getAllAnalysesMap() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_storageKey);
      
      if (jsonString == null) {
        return {};
      }
      
      final decoded = jsonDecode(jsonString);
      return Map<String, dynamic>.from(decoded as Map);
    } catch (e) {
      return {};
    }
  }
}