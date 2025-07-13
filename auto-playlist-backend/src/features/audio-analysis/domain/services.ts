import { Context, Effect } from 'effect'
import { HttpClient } from '@effect/platform'
import {
  AudioAnalysisResult,
  AnalysisError,
  AudioFetchError,
  FeatureExtractionError,
} from './types'

export interface AudioAnalysisService {
  readonly analyzeTrack: (
    url: string
  ) => Effect.Effect<
    AudioAnalysisResult,
    AnalysisError | AudioFetchError | FeatureExtractionError,
    HttpClient.HttpClient
  >
  readonly analyzeMultipleTracks: (
    urls: readonly string[]
  ) => Effect.Effect<
    readonly AudioAnalysisResult[],
    AnalysisError | AudioFetchError | FeatureExtractionError,
    HttpClient.HttpClient
  >
}

export const AudioAnalysisService = Context.GenericTag<AudioAnalysisService>(
  '@auto-playlist/AudioAnalysisService'
)
