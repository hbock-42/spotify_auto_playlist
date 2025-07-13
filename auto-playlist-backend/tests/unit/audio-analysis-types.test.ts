import { describe, it, expect } from 'vitest'
import type {
  AudioFeatures,
  AnalysisMetadata,
} from '../../src/features/audio-analysis/domain/types.js'

describe('Audio Analysis Types', () => {
  describe('AudioFeatures', () => {
    it('should have all required audio feature properties', () => {
      const mockFeatures: AudioFeatures = {
        energy: 0.5,
        danceability: 0.7,
        valence: 0.3,
        tempo: 120.5,
        acousticness: 0.2,
        loudness: -12.5,
        speechiness: 0.1,
        instrumentalness: 0.9,
        liveness: 0.15,
      }

      expect(typeof mockFeatures.energy).toBe('number')
      expect(typeof mockFeatures.danceability).toBe('number')
      expect(typeof mockFeatures.valence).toBe('number')
      expect(typeof mockFeatures.tempo).toBe('number')
      expect(typeof mockFeatures.acousticness).toBe('number')
      expect(typeof mockFeatures.loudness).toBe('number')
      expect(typeof mockFeatures.speechiness).toBe('number')
      expect(typeof mockFeatures.instrumentalness).toBe('number')
      expect(typeof mockFeatures.liveness).toBe('number')
    })

    it('should validate feature ranges', () => {
      const mockFeatures: AudioFeatures = {
        energy: 0.5,
        danceability: 0.7,
        valence: 0.3,
        tempo: 120.5,
        acousticness: 0.2,
        loudness: -12.5,
        speechiness: 0.1,
        instrumentalness: 0.9,
        liveness: 0.15,
      }

      // Most features should be between 0 and 1
      expect(mockFeatures.energy).toBeGreaterThanOrEqual(0)
      expect(mockFeatures.energy).toBeLessThanOrEqual(1)
      expect(mockFeatures.danceability).toBeGreaterThanOrEqual(0)
      expect(mockFeatures.danceability).toBeLessThanOrEqual(1)
      expect(mockFeatures.valence).toBeGreaterThanOrEqual(0)
      expect(mockFeatures.valence).toBeLessThanOrEqual(1)
      expect(mockFeatures.acousticness).toBeGreaterThanOrEqual(0)
      expect(mockFeatures.acousticness).toBeLessThanOrEqual(1)
      expect(mockFeatures.speechiness).toBeGreaterThanOrEqual(0)
      expect(mockFeatures.speechiness).toBeLessThanOrEqual(1)
      expect(mockFeatures.instrumentalness).toBeGreaterThanOrEqual(0)
      expect(mockFeatures.instrumentalness).toBeLessThanOrEqual(1)
      expect(mockFeatures.liveness).toBeGreaterThanOrEqual(0)
      expect(mockFeatures.liveness).toBeLessThanOrEqual(1)

      // Tempo can be higher than 1
      expect(mockFeatures.tempo).toBeGreaterThan(0)

      // Loudness can be negative (dB scale)
      expect(typeof mockFeatures.loudness).toBe('number')
    })
  })

  describe('AnalysisMetadata', () => {
    it('should have all required metadata properties', () => {
      const mockMetadata: AnalysisMetadata = {
        url: 'https://example.com/audio.mp3',
        duration: 30.5,
        sampleRate: 44100,
        frameSize: 1024,
        hopSize: 512,
        analysisTimestamp: new Date(),
      }

      expect(typeof mockMetadata.duration).toBe('number')
      expect(typeof mockMetadata.sampleRate).toBe('number')
      expect(typeof mockMetadata.frameSize).toBe('number')
      expect(typeof mockMetadata.hopSize).toBe('number')
      expect(mockMetadata.analysisTimestamp).toBeInstanceOf(Date)
    })

    it('should validate metadata ranges', () => {
      const mockMetadata: AnalysisMetadata = {
        url: 'https://example.com/audio.mp3',
        duration: 30.5,
        sampleRate: 44100,
        frameSize: 1024,
        hopSize: 512,
        analysisTimestamp: new Date(),
      }

      expect(mockMetadata.duration).toBeGreaterThan(0)
      expect(mockMetadata.sampleRate).toBeGreaterThan(0)
      expect(mockMetadata.frameSize).toBeGreaterThan(0)
      expect(mockMetadata.hopSize).toBeGreaterThan(0)
      expect(mockMetadata.analysisTimestamp.getTime()).toBeLessThanOrEqual(
        Date.now()
      )
    })
  })
})
