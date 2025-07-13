import { z } from 'zod'

export const TrackSearchQuerySchema = z.object({
  title: z.string().min(1, 'Track title is required'),
  artist: z.string().min(1, 'Artist name is required'),
})

export const BatchTrackSearchQuerySchema = z.object({
  queries: z.array(TrackSearchQuerySchema).min(1, 'At least one track query is required'),
})

export const ITunesTrackResultSchema = z.object({
  trackId: z.number(),
  trackName: z.string(),
  artistName: z.string(),
  previewUrl: z.string().url(),
  trackTimeMillis: z.number(),
  artworkUrl100: z.string().url(),
  primaryGenreName: z.string(),
  releaseDate: z.string(),
  collectionName: z.string(),
})

export const ITunesSearchResponseSchema = z.object({
  track: ITunesTrackResultSchema,
  attribution: z.literal('provided courtesy of iTunes'),
})

export const BatchITunesSearchResponseSchema = z.object({
  tracks: z.array(ITunesTrackResultSchema),
  attribution: z.literal('provided courtesy of iTunes'),
})

export const AudioFeaturesSchema = z.object({
  energy: z.number(),
  danceability: z.number(),
  valence: z.number(),
  tempo: z.number(),
  acousticness: z.number(),
  loudness: z.number(),
  speechiness: z.number(),
  instrumentalness: z.number(),
  liveness: z.number(),
})

export const AnalysisMetadataSchema = z.object({
  url: z.string(),
  duration: z.number(),
  sampleRate: z.number(),
  frameSize: z.number(),
  hopSize: z.number(),
  analysisTimestamp: z.date(),
})

export const AudioAnalysisResultSchema = z.object({
  features: AudioFeaturesSchema,
  metadata: AnalysisMetadataSchema,
})

export const ITunesAudioAnalysisResponseSchema = z.object({
  itunesResult: ITunesTrackResultSchema,
  analysisResult: AudioAnalysisResultSchema,
  attribution: z.literal('provided courtesy of iTunes'),
})