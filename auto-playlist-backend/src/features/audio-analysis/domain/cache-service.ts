import { Context, Effect } from 'effect'
import { AudioAnalysisResult } from './types'

export type CacheStatus = 'hit' | 'miss' | 'pending' | 'failed'

export interface CacheEntry {
  readonly trackId: string
  readonly audioFeaturesId: string | null
  readonly status: 'completed' | 'pending' | 'failed'
  readonly features: AudioAnalysisResult | null
  readonly errorMessage: string | null
  readonly cacheHitCount: number
  readonly createdAt: Date
  readonly updatedAt: Date
}

export interface CacheResult {
  readonly status: CacheStatus
  readonly features: AudioAnalysisResult | null
  readonly entry: CacheEntry | null
}

export interface CacheError {
  readonly _tag: 'CacheError'
  readonly message: string
  readonly cause?: unknown
}

export const CacheError = (message: string, cause?: unknown): CacheError => ({
  _tag: 'CacheError',
  message,
  cause,
})

export interface AudioAnalysisCacheService {
  readonly checkCache: (
    trackId: string
  ) => Effect.Effect<CacheResult, CacheError>

  readonly storeResult: (
    trackId: string,
    audioFeaturesId: string,
    features: AudioAnalysisResult
  ) => Effect.Effect<CacheEntry, CacheError>

  readonly storePending: (
    trackId: string
  ) => Effect.Effect<CacheEntry, CacheError>

  readonly storeError: (
    trackId: string,
    error: string
  ) => Effect.Effect<CacheEntry, CacheError>

  readonly invalidateCache: (trackId: string) => Effect.Effect<void, CacheError>

  readonly incrementHitCount: (
    trackId: string
  ) => Effect.Effect<CacheEntry, CacheError>
}

export const AudioAnalysisCacheService =
  Context.GenericTag<AudioAnalysisCacheService>(
    '@auto-playlist/AudioAnalysisCacheService'
  )
