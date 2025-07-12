import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/song_analysis.dart';
import '../../domain/failures/llm_failure.dart';

class OllamaApiClient {
  static const String _baseUrl = 'http://localhost:11434';
  static const String _model = 'llama3.1:8b';
  
  final Dio _dio;
  final Logger _logger;

  OllamaApiClient({
    required Dio dio,
    required Logger logger,
  })  : _dio = dio,
        _logger = logger {
    _setupDio();
  }

  void _setupDio() {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 2),
      sendTimeout: const Duration(seconds: 30),
    );
  }

  Future<Either<LlmFailure, SongAnalysis>> analyzeSong(SongMetadata metadata) async {
    try {
      final prompt = _buildAnalysisPrompt(metadata);
      
      final response = await _dio.post(
        '/api/generate',
        data: {
          'model': _model,
          'prompt': prompt,
          'stream': false,
          'format': 'json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final generatedText = responseData['response'] as String;
        
        try {
          // Parse the JSON response from the LLM
          final analysisJson = _parseJsonResponse(generatedText);
          final analysis = SongAnalysis(
            trackId: metadata.title, // Will be replaced with actual track ID later
            moods: List<String>.from(analysisJson['moods'] ?? []),
            contexts: List<String>.from(analysisJson['contexts'] ?? []),
            styles: List<String>.from(analysisJson['styles'] ?? []),
            confidence: (analysisJson['confidence'] ?? 0.0).toDouble(),
            analyzedAt: DateTime.now(),
          );
          
          return Right(analysis);
        } catch (e) {
          _logger.e('Failed to parse LLM response: $e');
          return Left(LlmFailure.invalidResponse('Failed to parse analysis: $e'));
        }
      } else {
        return Left(_mapStatusCodeToFailure(response.statusCode));
      }
    } on DioException catch (e) {
      return Left(_mapDioExceptionToFailure(e));
    } catch (e) {
      _logger.e('Unexpected error in song analysis: $e');
      return Left(LlmFailure.unknown(e.toString()));
    }
  }

  Future<Either<LlmFailure, bool>> isModelAvailable() async {
    try {
      final response = await _dio.get('/api/tags');
      
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final models = data['models'] as List<dynamic>?;
        
        if (models != null) {
          final hasModel = models.any((model) => 
            (model as Map<String, dynamic>)['name'] == _model);
          return Right(hasModel);
        }
        
        return const Right(false);
      } else {
        return Left(_mapStatusCodeToFailure(response.statusCode));
      }
    } on DioException catch (e) {
      return Left(_mapDioExceptionToFailure(e));
    } catch (e) {
      _logger.e('Unexpected error checking model availability: $e');
      return Left(LlmFailure.unknown(e.toString()));
    }
  }

  String _buildAnalysisPrompt(SongMetadata metadata) {
    return '''
Analyze this song and provide a structured classification in JSON format.

Song Information:
- Title: ${metadata.title}
- Artist: ${metadata.artist}
- Genres: ${metadata.genres.join(', ')}
- Energy: ${metadata.energy}
- Danceability: ${metadata.danceability}
- Valence: ${metadata.valence}
- Tempo: ${metadata.tempo}
- Acousticness: ${metadata.acousticness}

Provide your analysis in this exact JSON format:
{
  "moods": ["mood1", "mood2"],
  "contexts": ["context1", "context2"],
  "styles": ["style1", "style2"],
  "confidence": 0.85
}

Classification Guidelines:
- Moods: emotional qualities (happy, sad, energetic, calm, aggressive, romantic, etc.)
- Contexts: situations where the song fits (workout, party, relaxing, driving, studying, etc.)
- Styles: musical characteristics (upbeat, mellow, heavy, electronic, acoustic, etc.)
- Confidence: how certain you are about the classification (0.0 to 1.0)

Focus on the most relevant 2-3 categories for each type. Be concise and accurate.
''';
  }

  Map<String, dynamic> _parseJsonResponse(String response) {
    // Remove any markdown formatting or extra text
    final cleanResponse = response.trim();
    
    // Try to find JSON within the response
    final jsonStart = cleanResponse.indexOf('{');
    final jsonEnd = cleanResponse.lastIndexOf('}');
    
    if (jsonStart >= 0 && jsonEnd > jsonStart) {
      final jsonString = cleanResponse.substring(jsonStart, jsonEnd + 1);
      return Map<String, dynamic>.from(
        jsonDecode(jsonString) as Map<String, dynamic>);
    }
    
    throw FormatException('No valid JSON found in response: $response');
  }

  LlmFailure _mapStatusCodeToFailure(int? statusCode) {
    switch (statusCode) {
      case 400:
        return const LlmFailure.invalidResponse('Bad request');
      case 404:
        return const LlmFailure.modelNotAvailable('Model not found');
      case 429:
        return const LlmFailure.rateLimited();
      case 500:
      case 502:
      case 503:
        return LlmFailure.serverError('Server error: $statusCode');
      default:
        return LlmFailure.unknown('HTTP error: $statusCode');
    }
  }

  LlmFailure _mapDioExceptionToFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const LlmFailure.timeout();
      case DioExceptionType.connectionError:
        return LlmFailure.networkError('Connection error: ${e.message}');
      case DioExceptionType.badResponse:
        return _mapStatusCodeToFailure(e.response?.statusCode);
      case DioExceptionType.cancel:
        return LlmFailure.networkError('Request cancelled');
      case DioExceptionType.unknown:
        return LlmFailure.unknown('Unknown error: ${e.message}');
      case DioExceptionType.badCertificate:
        return LlmFailure.networkError('Certificate error: ${e.message}');
    }
  }
}