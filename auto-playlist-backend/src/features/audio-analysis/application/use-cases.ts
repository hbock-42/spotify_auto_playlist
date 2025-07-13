import { Effect } from 'effect'
import { HttpClient } from '@effect/platform'
import {
  AudioAnalysisService,
  AudioAnalysisResult,
  AnalysisError,
  AudioFetchError,
  FeatureExtractionError,
} from '../domain'

export interface AnalyzeTrackUseCase {
  readonly execute: (
    url: string
  ) => Effect.Effect<
    AudioAnalysisResult,
    AnalysisError | AudioFetchError | FeatureExtractionError,
    HttpClient.HttpClient
  >
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
