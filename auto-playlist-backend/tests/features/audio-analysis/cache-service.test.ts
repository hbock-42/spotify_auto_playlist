import { describe, it, expect, beforeEach, vi } from 'vitest'
import { Effect, Layer } from 'effect'
import { PoolClient } from 'pg'
import {
  AudioAnalysisCacheService,
  AudioAnalysisResult,
} from '../../../src/features/audio-analysis/domain'
import { SupabaseAudioAnalysisCacheService } from '../../../src/features/audio-analysis/infrastructure'
import { DatabaseService } from '../../../src/shared/database/connection'

// Mock the database functions
vi.mock('../../../src/generated/sqlc/cache_sql', () => ({
  getAnalysisCacheByTrackId: vi.fn(),
  createAnalysisCache: vi.fn(),
  updateAnalysisCache: vi.fn(),
  deleteAnalysisCacheByTrackId: vi.fn(),
}))

vi.mock('../../../src/generated/sqlc/audio_features_sql', () => ({
  getAudioFeaturesByTrackId: vi.fn(),
}))

import {
  getAnalysisCacheByTrackId,
  createAnalysisCache,
  updateAnalysisCache,
  deleteAnalysisCacheByTrackId,
} from '../../../src/generated/sqlc/cache_sql'
import { getAudioFeaturesByTrackId } from '../../../src/generated/sqlc/audio_features_sql'

describe('AudioAnalysisCacheService', () => {
  const mockClient = {
    query: vi.fn(),
  } as unknown as PoolClient

  const mockDatabaseService: DatabaseService = {
    pool: {} as never,
    getClient: vi.fn().mockReturnValue(Effect.succeed(mockClient)),
  }

  const mockTrackId = 'track-123'
  const mockAudioFeaturesId = 'features-456'
  const mockFeatures: AudioAnalysisResult = {
    features: {
      energy: 0.8,
      danceability: 0.7,
      valence: 0.6,
      tempo: 120,
      acousticness: 0.3,
      instrumentalness: 0.1,
      liveness: 0.2,
      speechiness: 0.1,
      loudness: -5.0,
    },
    metadata: {
      url: '', // Cache service returns empty URL - will be populated from track data if needed
      duration: 30000,
      sampleRate: 44100,
      frameSize: 2048,
      hopSize: 1024,
      analysisTimestamp: new Date(),
    },
  }

  const TestLayer = Layer.mergeAll(
    Layer.succeed(DatabaseService, mockDatabaseService),
    Layer.succeed(
      AudioAnalysisCacheService,
      new SupabaseAudioAnalysisCacheService(mockDatabaseService)
    )
  )

  beforeEach(() => {
    vi.clearAllMocks()
  })

  describe('checkCache', () => {
    it('should return cache miss when no entry exists', async () => {
      vi.mocked(getAnalysisCacheByTrackId).mockResolvedValue(null)

      const result = await Effect.runPromise(
        Effect.gen(function* () {
          const service = yield* AudioAnalysisCacheService
          return yield* service.checkCache(mockTrackId)
        }).pipe(Effect.provide(TestLayer))
      )

      expect(result.status).toBe('miss')
      expect(result.features).toBeNull()
      expect(result.entry).toBeNull()
    })

    it('should return cache hit with features for completed entry', async () => {
      const mockCacheRow = {
        id: 'cache-1',
        trackId: mockTrackId,
        audioFeaturesId: mockAudioFeaturesId,
        analysisStatus: 'completed',
        errorMessage: null,
        cacheHitCount: 1,
        createdAt: new Date(),
        updatedAt: new Date(),
      }

      vi.mocked(getAnalysisCacheByTrackId).mockResolvedValue(mockCacheRow)
      vi.mocked(getAudioFeaturesByTrackId).mockResolvedValue({
        id: mockAudioFeaturesId,
        trackId: mockTrackId,
        energy: 0.8,
        danceability: 0.7,
        valence: 0.6,
        tempo: 120,
        acousticness: 0.3,
        instrumentalness: 0.1,
        liveness: 0.2,
        speechiness: 0.1,
        loudness: -5.0,
        analysisConfidence: 0.95,
        analysisDurationMs: 30000,
        createdAt: new Date(),
      })
      vi.mocked(updateAnalysisCache).mockResolvedValue({
        ...mockCacheRow,
        cacheHitCount: 2,
      })

      const result = await Effect.runPromise(
        Effect.gen(function* () {
          const service = yield* AudioAnalysisCacheService
          return yield* service.checkCache(mockTrackId)
        }).pipe(Effect.provide(TestLayer))
      )

      expect(result.status).toBe('hit')
      expect(result.features).toMatchObject({
        features: mockFeatures.features,
        metadata: {
          url: '',
          duration: 30000,
          sampleRate: 44100,
          frameSize: 2048,
          hopSize: 1024,
        },
      })
      expect(result.entry).toBeTruthy()
    })

    it('should return pending status for pending entry', async () => {
      const mockCacheRow = {
        id: 'cache-1',
        trackId: mockTrackId,
        audioFeaturesId: null,
        analysisStatus: 'pending',
        errorMessage: null,
        cacheHitCount: 0,
        createdAt: new Date(),
        updatedAt: new Date(),
      }

      vi.mocked(getAnalysisCacheByTrackId).mockResolvedValue(mockCacheRow)

      const result = await Effect.runPromise(
        Effect.gen(function* () {
          const service = yield* AudioAnalysisCacheService
          return yield* service.checkCache(mockTrackId)
        }).pipe(Effect.provide(TestLayer))
      )

      expect(result.status).toBe('pending')
      expect(result.features).toBeNull()
      expect(result.entry?.status).toBe('pending')
    })

    it('should return failed status for failed entry', async () => {
      const mockCacheRow = {
        id: 'cache-1',
        trackId: mockTrackId,
        audioFeaturesId: null,
        analysisStatus: 'failed',
        errorMessage: 'Analysis failed',
        cacheHitCount: 0,
        createdAt: new Date(),
        updatedAt: new Date(),
      }

      vi.mocked(getAnalysisCacheByTrackId).mockResolvedValue(mockCacheRow)

      const result = await Effect.runPromise(
        Effect.gen(function* () {
          const service = yield* AudioAnalysisCacheService
          return yield* service.checkCache(mockTrackId)
        }).pipe(Effect.provide(TestLayer))
      )

      expect(result.status).toBe('failed')
      expect(result.features).toBeNull()
      expect(result.entry?.status).toBe('failed')
      expect(result.entry?.errorMessage).toBe('Analysis failed')
    })
  })

  describe('storePending', () => {
    it('should create a pending cache entry', async () => {
      const mockCreatedEntry = {
        id: 'cache-1',
        trackId: mockTrackId,
        audioFeaturesId: null,
        analysisStatus: 'pending',
        errorMessage: null,
        cacheHitCount: 0,
        createdAt: new Date(),
        updatedAt: new Date(),
      }

      vi.mocked(createAnalysisCache).mockResolvedValue(mockCreatedEntry)

      const result = await Effect.runPromise(
        Effect.gen(function* () {
          const service = yield* AudioAnalysisCacheService
          return yield* service.storePending(mockTrackId)
        }).pipe(Effect.provide(TestLayer))
      )

      expect(result.trackId).toBe(mockTrackId)
      expect(result.status).toBe('pending')
      expect(createAnalysisCache).toHaveBeenCalledWith(mockClient, {
        trackId: mockTrackId,
        analysisStatus: 'pending',
        errorMessage: null,
      })
    })
  })

  describe('storeResult', () => {
    it('should store successful analysis result', async () => {
      const mockUpdatedEntry = {
        id: 'cache-1',
        trackId: mockTrackId,
        audioFeaturesId: mockAudioFeaturesId,
        analysisStatus: 'completed',
        errorMessage: null,
        cacheHitCount: 1,
        createdAt: new Date(),
        updatedAt: new Date(),
      }

      vi.mocked(updateAnalysisCache).mockResolvedValue(mockUpdatedEntry)

      const result = await Effect.runPromise(
        Effect.gen(function* () {
          const service = yield* AudioAnalysisCacheService
          return yield* service.storeResult(
            mockTrackId,
            mockAudioFeaturesId,
            mockFeatures
          )
        }).pipe(Effect.provide(TestLayer))
      )

      expect(result.trackId).toBe(mockTrackId)
      expect(result.status).toBe('completed')
      expect(result.audioFeaturesId).toBe(mockAudioFeaturesId)
      expect(updateAnalysisCache).toHaveBeenCalledWith(mockClient, {
        trackId: mockTrackId,
        audioFeaturesId: mockAudioFeaturesId,
        analysisStatus: 'completed',
        errorMessage: null,
      })
    })
  })

  describe('storeError', () => {
    it('should store error result', async () => {
      const errorMessage = 'Analysis failed due to network error'
      const mockUpdatedEntry = {
        id: 'cache-1',
        trackId: mockTrackId,
        audioFeaturesId: null,
        analysisStatus: 'failed',
        errorMessage,
        cacheHitCount: 0,
        createdAt: new Date(),
        updatedAt: new Date(),
      }

      vi.mocked(updateAnalysisCache).mockResolvedValue(mockUpdatedEntry)

      const result = await Effect.runPromise(
        Effect.gen(function* () {
          const service = yield* AudioAnalysisCacheService
          return yield* service.storeError(mockTrackId, errorMessage)
        }).pipe(Effect.provide(TestLayer))
      )

      expect(result.trackId).toBe(mockTrackId)
      expect(result.status).toBe('failed')
      expect(result.errorMessage).toBe(errorMessage)
      expect(updateAnalysisCache).toHaveBeenCalledWith(mockClient, {
        trackId: mockTrackId,
        audioFeaturesId: null,
        analysisStatus: 'failed',
        errorMessage,
      })
    })
  })

  describe('invalidateCache', () => {
    it('should delete cache entry', async () => {
      vi.mocked(deleteAnalysisCacheByTrackId).mockResolvedValue()

      await Effect.runPromise(
        Effect.gen(function* () {
          const service = yield* AudioAnalysisCacheService
          return yield* service.invalidateCache(mockTrackId)
        }).pipe(Effect.provide(TestLayer))
      )

      expect(deleteAnalysisCacheByTrackId).toHaveBeenCalledWith(mockClient, {
        trackId: mockTrackId,
      })
    })
  })
})
