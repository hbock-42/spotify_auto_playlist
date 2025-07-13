import { Effect, Layer } from 'effect'
import { EssentiaWASM } from 'essentia.js/dist/essentia-wasm.es.js'
import Essentia from 'essentia.js/dist/essentia.js-core.es.js'
import { HttpClient } from '@effect/platform'
import {
  AudioAnalysisService,
  AudioAnalysisResult,
  AudioFeatures,
  AnalysisMetadata,
  AnalysisError,
  AudioFetchError,
  FeatureExtractionError,
} from '../domain'

export class EssentiaAudioAnalysisService implements AudioAnalysisService {
  private essentia: Essentia | null = null

  private initializeEssentia = (): Effect.Effect<Essentia, AnalysisError> =>
    Effect.gen(
      function* (this: EssentiaAudioAnalysisService) {
        if (this.essentia) return this.essentia

        const wasmModule = yield* Effect.tryPromise({
          try: () => EssentiaWASM(),
          catch: (error) =>
            new AnalysisError({
              message: 'Failed to initialize Essentia WASM module',
              cause: error,
            }),
        })

        this.essentia = new Essentia(wasmModule)
        return this.essentia
      }.bind(this)
    )

  private fetchAudioBuffer = (
    url: string
  ): Effect.Effect<ArrayBuffer, AudioFetchError, HttpClient.HttpClient> =>
    Effect.gen(function* () {
      const httpClient = yield* HttpClient.HttpClient

      const response = yield* httpClient.get(url).pipe(
        Effect.flatMap((response) => response.arrayBuffer),
        Effect.catchAll((error) =>
          Effect.fail(
            new AudioFetchError({
              message: `Failed to fetch audio from URL: ${url}`,
              cause: error,
              url,
            })
          )
        )
      )

      return response
    })

  private extractFeatures = (
    audioBuffer: ArrayBuffer,
    url: string
  ): Effect.Effect<
    AudioAnalysisResult,
    AnalysisError | FeatureExtractionError
  > =>
    Effect.gen(
      function* (this: EssentiaAudioAnalysisService) {
        const essentia = yield* this.initializeEssentia()

        const audioContext = new (globalThis.AudioContext ||
          (globalThis as { webkitAudioContext?: typeof AudioContext })
            .webkitAudioContext ||
          AudioContext)()
        const decodedAudio = yield* Effect.tryPromise({
          try: () => audioContext.decodeAudioData(audioBuffer),
          catch: (error) =>
            new FeatureExtractionError({
              message: 'Failed to decode audio buffer',
              cause: error,
              url,
            }),
        })

        const channelData = decodedAudio.getChannelData(0)
        const vectorInput = essentia.arrayToVector(channelData)

        const features = yield* Effect.try({
          try: () => {
            // Extract basic audio features using Essentia algorithms
            const rms = essentia.RMS(vectorInput)
            const spectralCentroid = essentia.SpectralCentroid(vectorInput)
            const zcr = essentia.ZeroCrossingRate(vectorInput)
            const mfcc = essentia.MFCC(vectorInput)
            const spectralFlux = essentia.SpectralFlux(vectorInput, vectorInput)

            // Map Essentia features to our AudioFeatures interface
            const audioFeatures: AudioFeatures = {
              energy: rms.rms,
              danceability: Math.min(
                1.0,
                spectralCentroid.spectralCentroid / 4000
              ),
              valence: Math.min(1.0, zcr.zeroCrossingRate * 10),
              tempo: 120, // placeholder
              acousticness:
                1.0 - Math.min(1.0, spectralCentroid.spectralCentroid / 8000),
              loudness: 20 * Math.log10(rms.rms + 1e-10),
              speechiness: Math.min(1.0, (mfcc.mfcc[1] ?? 0) + 0.5),
              instrumentalness: 1.0 - Math.min(1.0, zcr.zeroCrossingRate * 5),
              liveness: Math.min(1.0, spectralFlux.spectralFlux * 100),
            }

            const metadata: AnalysisMetadata = {
              url,
              duration: decodedAudio.duration,
              sampleRate: decodedAudio.sampleRate,
              frameSize: 1024,
              hopSize: 512,
              analysisTimestamp: new Date(),
            }

            return { features: audioFeatures, metadata }
          },
          catch: (error) =>
            new FeatureExtractionError({
              message: 'Failed to extract audio features',
              cause: error,
              url,
            }),
        })

        // Clean up Essentia vectors
        vectorInput.delete()

        return features
      }.bind(this)
    )

  analyzeTrack = (
    url: string
  ): Effect.Effect<
    AudioAnalysisResult,
    AnalysisError | AudioFetchError | FeatureExtractionError,
    HttpClient.HttpClient
  > =>
    Effect.gen(
      function* (this: EssentiaAudioAnalysisService) {
        const audioBuffer = yield* this.fetchAudioBuffer(url)
        const result = yield* this.extractFeatures(audioBuffer, url)
        return result
      }.bind(this)
    )

  analyzeMultipleTracks = (
    urls: readonly string[]
  ): Effect.Effect<
    readonly AudioAnalysisResult[],
    AnalysisError | AudioFetchError | FeatureExtractionError,
    HttpClient.HttpClient
  > =>
    Effect.all(
      urls.map((url) => this.analyzeTrack(url)),
      { concurrency: 3 }
    )
}

export const AudioAnalysisServiceLive = Layer.succeed(
  AudioAnalysisService,
  new EssentiaAudioAnalysisService()
)
