import { z } from 'zod'

export const AudioFeaturesSchema = z.object({
  energy: z.number().min(0).max(1),
  danceability: z.number().min(0).max(1),
  valence: z.number().min(0).max(1),
  tempo: z.number().min(0),
  acousticness: z.number().min(0).max(1),
  loudness: z.number(),
  speechiness: z.number().min(0).max(1),
  instrumentalness: z.number().min(0).max(1),
  liveness: z.number().min(0).max(1),
})

export const AnalysisMetadataSchema = z.object({
  url: z.string().url(),
  duration: z.number().positive(),
  sampleRate: z.number().positive(),
  frameSize: z.number().positive(),
  hopSize: z.number().positive(),
  analysisTimestamp: z.date(),
})

export const AudioAnalysisResultSchema = z.object({
  features: AudioFeaturesSchema,
  metadata: AnalysisMetadataSchema,
})

export const AnalyzeTrackInputSchema = z.object({
  url: z.string().url().describe('URL of the audio track to analyze'),
})

export const AnalyzeBatchTracksInputSchema = z.object({
  urls: z
    .array(z.string().url())
    .min(1)
    .max(50)
    .describe('Array of audio track URLs to analyze'),
})

export type AudioFeaturesOutput = z.infer<typeof AudioFeaturesSchema>
export type AnalysisMetadataOutput = z.infer<typeof AnalysisMetadataSchema>
export type AudioAnalysisResultOutput = z.infer<
  typeof AudioAnalysisResultSchema
>
export type AnalyzeTrackInput = z.infer<typeof AnalyzeTrackInputSchema>
export type AnalyzeBatchTracksInput = z.infer<
  typeof AnalyzeBatchTracksInputSchema
>
