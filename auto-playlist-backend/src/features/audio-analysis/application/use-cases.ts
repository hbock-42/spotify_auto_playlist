import { Effect } from 'effect'
import { HttpClient } from '@effect/platform'
import {
  AudioAnalysisService,
  AudioAnalysisCacheService,
  AudioAnalysisResult,
  AnalysisError,
  AudioFetchError,
  FeatureExtractionError,
  CacheError,
} from '../domain'
import { createAudioFeatures } from '../../../generated/sqlc/audio_features_sql'
import { DatabaseService } from '../../../shared/database/connection'

export interface AnalyzeTrackWithCacheUseCase {
  readonly execute: (
    trackId: string,
    url: string
  ) => Effect.Effect<
    AudioAnalysisResult,
    AnalysisError | AudioFetchError | FeatureExtractionError | CacheError,
    HttpClient.HttpClient
  >
}

export interface GetCachedAnalysisUseCase {
  readonly execute: (
    trackId: string
  ) => Effect.Effect<AudioAnalysisResult | null, CacheError>
}

export interface AnalyzeBatchTracksUseCase {
  readonly execute: (
    urls: readonly string[]
  ) => Effect.Effect<
    readonly AudioAnalysisResult[],
    AnalysisError | AudioFetchError | FeatureExtractionError,
    HttpClient.HttpClient
  >
}

export const analyzeTrackWithCacheUseCase = Effect.gen(function* () {
  const audioAnalysisService = yield* AudioAnalysisService
  const cacheService = yield* AudioAnalysisCacheService
  const databaseService = yield* Effect.serviceOption(DatabaseService)

  return {
    execute: (trackId: string, url: string) =>
      Effect.gen(function* () {
        // Check cache first
        const cacheResult = yield* cacheService.checkCache(trackId)

        switch (cacheResult.status) {
          case 'hit':
            if (cacheResult.features) {
              return cacheResult.features
            }
            // Hit without features means corrupted cache, continue to reanalyze
            break
          case 'pending':
            // Return pending status error
            return yield* Effect.fail(
              new AnalysisError({ message: 'Analysis already in progress' })
            )
          case 'failed':
            // Clear failed cache and try again
            yield* cacheService.invalidateCache(trackId)
            break
          case 'miss':
            // Continue to analyze
            break
        }

        // Cache miss - store pending and perform analysis
        yield* cacheService.storePending(trackId)

        const result = yield* Effect.gen(function* () {
          // Perform the actual analysis
          const analysisResult = yield* audioAnalysisService.analyzeTrack(url)

          // Store the audio features in the database if we have a database service
          if (databaseService._tag === 'Some') {
            const client = yield* databaseService.value.getClient().pipe(
              Effect.mapError(
                (error) =>
                  new AnalysisError({
                    message: 'Failed to get database client',
                    cause: error,
                  })
              )
            )
            const audioFeaturesResult = yield* Effect.tryPromise({
              try: () =>
                createAudioFeatures(client, {
                  trackId,
                  energy: analysisResult.features.energy.toString(),
                  danceability: analysisResult.features.danceability.toString(),
                  valence: analysisResult.features.valence.toString(),
                  tempo: analysisResult.features.tempo.toString(),
                  acousticness: analysisResult.features.acousticness.toString(),
                  instrumentalness:
                    analysisResult.features.instrumentalness?.toString() ||
                    null,
                  liveness:
                    analysisResult.features.liveness?.toString() || null,
                  speechiness:
                    analysisResult.features.speechiness?.toString() || null,
                  loudness:
                    analysisResult.features.loudness?.toString() || null,
                  analysisConfidence: '0.95', // Default confidence
                  analysisDurationMs: '30000', // 30 seconds for iTunes preview
                }),
              catch: (error) =>
                new AnalysisError({
                  message: 'Failed to store audio features',
                  cause: error,
                }),
            })

            if (audioFeaturesResult?.id) {
              // Store successful result in cache
              yield* cacheService.storeResult(
                trackId,
                audioFeaturesResult.id,
                analysisResult
              )
            }
          }

          return analysisResult
        }).pipe(
          Effect.catchAll((error) =>
            Effect.gen(function* () {
              // Store error in cache
              const errorMessage =
                error instanceof Error
                  ? error.message
                  : 'Unknown analysis error'
              yield* cacheService.storeError(trackId, errorMessage)
              return yield* Effect.fail(error)
            })
          )
        )

        return result
      }),
  } satisfies AnalyzeTrackWithCacheUseCase
})

export const getCachedAnalysisUseCase = Effect.gen(function* () {
  const cacheService = yield* AudioAnalysisCacheService

  return {
    execute: (trackId: string) =>
      Effect.gen(function* () {
        const cacheResult = yield* cacheService.checkCache(trackId)
        return cacheResult.features
      }),
  } satisfies GetCachedAnalysisUseCase
})

export const analyzeTrackUseCase = Effect.gen(function* () {
  const audioAnalysisService = yield* AudioAnalysisService

  return {
    execute: (url: string) => audioAnalysisService.analyzeTrack(url),
  } satisfies AnalyzeTrackUseCase
})

export const analyzeBatchTracksUseCase = Effect.gen(function* () {
  const audioAnalysisService = yield* AudioAnalysisService

  return {
    execute: (urls: readonly string[]) =>
      audioAnalysisService.analyzeMultipleTracks(urls),
  } satisfies AnalyzeBatchTracksUseCase
})

// Legacy interface for backward compatibility
export interface AnalyzeTrackUseCase {
  readonly execute: (
    url: string
  ) => Effect.Effect<
    AudioAnalysisResult,
    AnalysisError | AudioFetchError | FeatureExtractionError,
    HttpClient.HttpClient
  >
}
