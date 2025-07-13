import { Effect, Layer } from 'effect'
import {
  AudioAnalysisCacheService,
  CacheEntry,
  CacheResult,
  CacheError,
  AudioAnalysisResult,
} from '../domain'
import {
  getAnalysisCacheByTrackId,
  createAnalysisCache,
  updateAnalysisCache,
  deleteAnalysisCacheByTrackId,
  GetAnalysisCacheByTrackIdRow,
} from '../../../generated/sqlc/cache_sql'
import { getAudioFeaturesByTrackId } from '../../../generated/sqlc/audio_features_sql'
import { DatabaseService } from '../../../shared/database/connection'

export class SupabaseAudioAnalysisCacheService
  implements AudioAnalysisCacheService
{
  constructor(private readonly databaseService: DatabaseService) {}

  private mapCacheRowToEntry(row: GetAnalysisCacheByTrackIdRow): CacheEntry {
    return {
      trackId: row.trackId,
      audioFeaturesId: row.audioFeaturesId,
      status: row.analysisStatus as 'completed' | 'pending' | 'failed',
      features: null, // Will be populated separately if needed
      errorMessage: row.errorMessage,
      cacheHitCount: row.cacheHitCount,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    }
  }

  private getAudioFeatures(
    audioFeaturesId: string
  ): Effect.Effect<AudioAnalysisResult | null, CacheError> {
    return Effect.gen(
      function* (this: SupabaseAudioAnalysisCacheService) {
        const client = yield* this.databaseService
          .getClient()
          .pipe(
            Effect.mapError(() => CacheError('Failed to get database client'))
          )
        const features = yield* Effect.tryPromise({
          try: () =>
            getAudioFeaturesByTrackId(client, { trackId: audioFeaturesId }),
          catch: (error) => CacheError('Failed to get audio features', error),
        }).pipe(
          Effect.mapError(() => CacheError('Failed to get audio features'))
        )

        if (!features) return null

        return {
          features: {
            energy: features.energy,
            danceability: features.danceability,
            valence: features.valence,
            tempo: features.tempo,
            acousticness: features.acousticness,
            instrumentalness: features.instrumentalness,
            liveness: features.liveness,
            speechiness: features.speechiness,
            loudness: features.loudness,
          },
          metadata: {
            url: '', // Will be populated from track data if needed
            duration: 30000, // iTunes preview duration
            sampleRate: 44100,
            frameSize: 2048,
            hopSize: 1024,
            analysisTimestamp: features.createdAt,
          },
        } as AudioAnalysisResult
      }.bind(this)
    )
  }

  checkCache(trackId: string): Effect.Effect<CacheResult, CacheError> {
    return Effect.gen(
      function* (this: SupabaseAudioAnalysisCacheService) {
        const client = yield* this.databaseService
          .getClient()
          .pipe(
            Effect.mapError(() => CacheError('Failed to get database client'))
          )

        const cacheRow = yield* Effect.tryPromise({
          try: () => getAnalysisCacheByTrackId(client, { trackId }),
          catch: (error) =>
            CacheError(`Failed to check cache for track ${trackId}`, error),
        }).pipe(
          Effect.mapError(() =>
            CacheError(`Failed to check cache for track ${trackId}`)
          )
        )

        if (!cacheRow) {
          return {
            status: 'miss' as const,
            features: null,
            entry: null,
          }
        }

        const entry = this.mapCacheRowToEntry(cacheRow)

        switch (entry.status) {
          case 'completed': {
            if (entry.audioFeaturesId) {
              const features = yield* this.getAudioFeatures(
                entry.audioFeaturesId
              )
              yield* this.incrementHitCount(trackId)

              return {
                status: 'hit' as const,
                features,
                entry: { ...entry, features },
              }
            }
            return {
              status: 'failed' as const,
              features: null,
              entry,
            }
          }
          case 'pending':
            return {
              status: 'pending' as const,
              features: null,
              entry,
            }
          case 'failed':
            return {
              status: 'failed' as const,
              features: null,
              entry,
            }
          default:
            return {
              status: 'miss' as const,
              features: null,
              entry,
            }
        }
      }.bind(this)
    )
  }

  storeResult(
    trackId: string,
    audioFeaturesId: string,
    features: AudioAnalysisResult
  ): Effect.Effect<CacheEntry, CacheError> {
    return Effect.gen(
      function* (this: SupabaseAudioAnalysisCacheService) {
        const client = yield* this.databaseService
          .getClient()
          .pipe(
            Effect.mapError(() => CacheError('Failed to get database client'))
          )

        const result = yield* Effect.tryPromise({
          try: () =>
            updateAnalysisCache(client, {
              trackId,
              audioFeaturesId,
              analysisStatus: 'completed',
              errorMessage: null,
            }),
          catch: (error) =>
            CacheError(`Failed to store result for track ${trackId}`, error),
        }).pipe(
          Effect.mapError(() =>
            CacheError(`Failed to store result for track ${trackId}`)
          )
        )

        if (!result) {
          return yield* Effect.fail(CacheError('Failed to update cache entry'))
        }

        return {
          ...this.mapCacheRowToEntry(result),
          features,
        }
      }.bind(this)
    )
  }

  storePending(trackId: string): Effect.Effect<CacheEntry, CacheError> {
    return Effect.gen(
      function* (this: SupabaseAudioAnalysisCacheService) {
        const client = yield* this.databaseService
          .getClient()
          .pipe(
            Effect.mapError(() => CacheError('Failed to get database client'))
          )

        const result = yield* Effect.tryPromise({
          try: () =>
            createAnalysisCache(client, {
              trackId,
              analysisStatus: 'pending',
              errorMessage: null,
            }),
          catch: (error) =>
            CacheError(
              `Failed to store pending status for track ${trackId}`,
              error
            ),
        }).pipe(
          Effect.mapError(() =>
            CacheError(`Failed to store pending status for track ${trackId}`)
          )
        )

        if (!result) {
          return yield* Effect.fail(CacheError('Failed to create cache entry'))
        }

        return this.mapCacheRowToEntry(result)
      }.bind(this)
    )
  }

  storeError(
    trackId: string,
    error: string
  ): Effect.Effect<CacheEntry, CacheError> {
    return Effect.gen(
      function* (this: SupabaseAudioAnalysisCacheService) {
        const client = yield* this.databaseService
          .getClient()
          .pipe(
            Effect.mapError(() => CacheError('Failed to get database client'))
          )

        const result = yield* Effect.tryPromise({
          try: () =>
            updateAnalysisCache(client, {
              trackId,
              audioFeaturesId: null,
              analysisStatus: 'failed',
              errorMessage: error,
            }),
          catch: (err) =>
            CacheError(`Failed to store error for track ${trackId}`, err),
        }).pipe(
          Effect.mapError(() =>
            CacheError(`Failed to store error for track ${trackId}`)
          )
        )

        if (!result) {
          return yield* Effect.fail(
            CacheError('Failed to update cache entry with error')
          )
        }

        return this.mapCacheRowToEntry(result)
      }.bind(this)
    )
  }

  invalidateCache(trackId: string): Effect.Effect<void, CacheError> {
    return Effect.gen(
      function* (this: SupabaseAudioAnalysisCacheService) {
        const client = yield* this.databaseService
          .getClient()
          .pipe(
            Effect.mapError(() => CacheError('Failed to get database client'))
          )

        yield* Effect.tryPromise({
          try: () => deleteAnalysisCacheByTrackId(client, { trackId }),
          catch: (error) =>
            CacheError(
              `Failed to invalidate cache for track ${trackId}`,
              error
            ),
        }).pipe(
          Effect.mapError(() =>
            CacheError(`Failed to invalidate cache for track ${trackId}`)
          )
        )
      }.bind(this)
    )
  }

  incrementHitCount(trackId: string): Effect.Effect<CacheEntry, CacheError> {
    return Effect.gen(
      function* (this: SupabaseAudioAnalysisCacheService) {
        const client = yield* this.databaseService
          .getClient()
          .pipe(
            Effect.mapError(() => CacheError('Failed to get database client'))
          )

        const result = yield* Effect.tryPromise({
          try: () =>
            updateAnalysisCache(client, {
              trackId,
              audioFeaturesId: null, // This will be ignored due to the SQL logic
              analysisStatus: 'completed', // This will be ignored
              errorMessage: null, // This will be ignored
            }),
          catch: (error) =>
            CacheError(
              `Failed to increment hit count for track ${trackId}`,
              error
            ),
        }).pipe(
          Effect.mapError(() =>
            CacheError(`Failed to increment hit count for track ${trackId}`)
          )
        )

        if (!result) {
          return yield* Effect.fail(CacheError('Failed to increment hit count'))
        }

        return this.mapCacheRowToEntry(result)
      }.bind(this)
    )
  }
}

export const AudioAnalysisCacheServiceLive = Layer.effect(
  AudioAnalysisCacheService,
  Effect.gen(function* () {
    const databaseService = yield* DatabaseService
    return new SupabaseAudioAnalysisCacheService(databaseService)
  })
)
