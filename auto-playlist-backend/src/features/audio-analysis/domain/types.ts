import { Data } from 'effect'

export interface AudioFeatures {
  readonly energy: number
  readonly danceability: number
  readonly valence: number
  readonly tempo: number
  readonly acousticness: number
  readonly loudness: number
  readonly speechiness: number
  readonly instrumentalness: number
  readonly liveness: number
}

export interface AnalysisMetadata {
  readonly url: string
  readonly duration: number
  readonly sampleRate: number
  readonly frameSize: number
  readonly hopSize: number
  readonly analysisTimestamp: Date
}

export interface AudioAnalysisResult {
  readonly features: AudioFeatures
  readonly metadata: AnalysisMetadata
}

export class AnalysisError extends Data.TaggedError('AnalysisError')<{
  readonly message: string
  readonly cause?: unknown
  readonly url?: string
}> {}

export class AudioFetchError extends Data.TaggedError('AudioFetchError')<{
  readonly message: string
  readonly cause?: unknown
  readonly url: string
}> {}

export class FeatureExtractionError extends Data.TaggedError(
  'FeatureExtractionError'
)<{
  readonly message: string
  readonly cause?: unknown
  readonly url?: string
}> {}
