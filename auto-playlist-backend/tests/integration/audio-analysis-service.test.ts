import { describe, it, expect } from 'vitest'
import { Effect } from 'effect'
import { MockEssentiaAudioAnalysisService } from '../fixtures/mock-essentia-service.js'

describe('Audio Analysis Service Integration', () => {
  const service = new MockEssentiaAudioAnalysisService()
  const testUrl = 'https://freesound.org/data/previews/328/328857_230356-lq.mp3'

  describe('Single Track Analysis', () => {
    it('should analyze a track and return audio features', async () => {
      const result = await Effect.runPromise(service.analyzeTrack(testUrl))

      // Verify the result structure
      expect(result).toBeDefined()
      expect(result.features).toBeDefined()
      expect(result.metadata).toBeDefined()

      // Verify audio features
      const { features } = result
      expect(typeof features.energy).toBe('number')
      expect(typeof features.danceability).toBe('number')
      expect(typeof features.valence).toBe('number')
      expect(typeof features.tempo).toBe('number')
      expect(typeof features.acousticness).toBe('number')
      expect(typeof features.loudness).toBe('number')
      expect(typeof features.speechiness).toBe('number')
      expect(typeof features.instrumentalness).toBe('number')
      expect(typeof features.liveness).toBe('number')

      // Verify feature ranges (0-1 for most, tempo can be higher)
      expect(features.energy).toBeGreaterThanOrEqual(0)
      expect(features.energy).toBeLessThanOrEqual(1)
      expect(features.danceability).toBeGreaterThanOrEqual(0)
      expect(features.danceability).toBeLessThanOrEqual(1)
      expect(features.valence).toBeGreaterThanOrEqual(0)
      expect(features.valence).toBeLessThanOrEqual(1)
      expect(features.tempo).toBeGreaterThan(0)
      expect(features.acousticness).toBeGreaterThanOrEqual(0)
      expect(features.acousticness).toBeLessThanOrEqual(1)
      expect(features.speechiness).toBeGreaterThanOrEqual(0)
      expect(features.speechiness).toBeLessThanOrEqual(1)
      expect(features.instrumentalness).toBeGreaterThanOrEqual(0)
      expect(features.instrumentalness).toBeLessThanOrEqual(1)
      expect(features.liveness).toBeGreaterThanOrEqual(0)
      expect(features.liveness).toBeLessThanOrEqual(1)

      // Verify metadata
      const { metadata } = result
      expect(typeof metadata.duration).toBe('number')
      expect(metadata.duration).toBeGreaterThan(0)
      expect(typeof metadata.sampleRate).toBe('number')
      expect(metadata.sampleRate).toBeGreaterThan(0)
      expect(typeof metadata.frameSize).toBe('number')
      expect(metadata.frameSize).toBeGreaterThan(0)
      expect(typeof metadata.hopSize).toBe('number')
      expect(metadata.hopSize).toBeGreaterThan(0)
      expect(metadata.analysisTimestamp).toBeInstanceOf(Date)
      expect(metadata.url).toBe(testUrl)
    })

    it('should handle invalid URLs gracefully', async () => {
      const invalidUrl = 'https://invalid-url-that-does-not-exist.com/audio.mp3'

      await expect(
        Effect.runPromise(service.analyzeTrack(invalidUrl))
      ).rejects.toThrow()
    })

    it('should handle non-audio URLs gracefully', async () => {
      const nonAudioUrl = 'https://httpbin.org/json'

      await expect(
        Effect.runPromise(service.analyzeTrack(nonAudioUrl))
      ).rejects.toThrow()
    })
  })

  describe('Multiple Track Analysis', () => {
    it('should analyze multiple tracks', async () => {
      const urls = [testUrl, 'https://example.com/track2.mp3']

      const results = await Effect.runPromise(
        service.analyzeMultipleTracks(urls)
      )

      expect(Array.isArray(results)).toBe(true)
      expect(results).toHaveLength(2)

      results.forEach((result, index) => {
        expect(result.url).toBe(urls[index])
        expect(result.features).toBeDefined()
        expect(result.metadata).toBeDefined()
      })
    })

    it('should handle mixed valid and invalid URLs', async () => {
      const urls = [testUrl, 'https://invalid-url.com/audio.mp3']

      await expect(
        Effect.runPromise(service.analyzeMultipleTracks(urls))
      ).rejects.toThrow()
    })
  })

  describe('Performance', () => {
    it('should complete analysis within reasonable time', async () => {
      const startTime = Date.now()

      const result = await Effect.runPromise(service.analyzeTrack(testUrl))
      const endTime = Date.now()
      const duration = endTime - startTime

      expect(result).toBeDefined()
      expect(duration).toBeLessThan(100) // Mock should be very fast
    })
  })

  describe('Effect Error Handling', () => {
    it('should properly propagate errors through Effect chain', async () => {
      const testEffect = service.analyzeTrack('').pipe(
        Effect.catchAll((error) =>
          Effect.sync(() => {
            expect(error).toBeDefined()
            return 'error-caught'
          })
        )
      )

      const result = await Effect.runPromise(testEffect)
      expect(result).toBe('error-caught')
    })
  })
})
