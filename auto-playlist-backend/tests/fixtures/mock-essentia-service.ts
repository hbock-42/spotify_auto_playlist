import { Effect } from 'effect'
import {
  AudioFetchError,
  AnalysisError,
  type AudioFeatures,
  type AnalysisMetadata,
} from '../../src/features/audio-analysis/domain/types.js'

export class MockEssentiaAudioAnalysisService {
  analyzeTrack = (url: string) =>
    Effect.gen(function* () {
      // Simulate different behaviors based on URL
      if (url.includes('invalid-url') || url === '') {
        yield* Effect.fail(
          new AudioFetchError({
            message: `Failed to fetch audio from URL: ${url}`,
            cause: new Error('Invalid URL'),
            url,
          })
        )
      }

      if (url.includes('json') || url.includes('non-audio')) {
        yield* Effect.fail(
          new AnalysisError({
            message: 'Invalid audio format',
            cause: new Error('Not an audio file'),
          })
        )
      }

      // Return mock features based on URL characteristics
      const features: AudioFeatures = {
        energy: 0.65,
        danceability: 0.72,
        valence: 0.48,
        tempo: 120.5,
        acousticness: 0.25,
        loudness: -8.5,
        speechiness: 0.12,
        instrumentalness: 0.85,
        liveness: 0.18,
      }

      const metadata: AnalysisMetadata = {
        url,
        duration: 30.0,
        sampleRate: 44100,
        frameSize: 1024,
        hopSize: 512,
        analysisTimestamp: new Date(),
      }

      return { features, metadata }
    })

  analyzeMultipleTracks = (urls: readonly string[]) =>
    Effect.gen(
      function* (this: MockEssentiaAudioAnalysisService) {
        const results: {
          url: string
          features: AudioFeatures
          metadata: AnalysisMetadata
        }[] = []
        for (const url of urls) {
          const result = yield* this.analyzeTrack(url)
          results.push({ url, ...result })
        }
        return results
      }.bind(this)
    )
}
