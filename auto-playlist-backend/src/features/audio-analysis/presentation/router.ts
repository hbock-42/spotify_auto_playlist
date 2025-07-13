import { initTRPC, TRPCError } from '@trpc/server'
import { z } from 'zod'
import { Effect } from 'effect'
import { NodeHttpClient } from '@effect/platform-node'
import {
  AnalyzeTrackInputSchema,
  AnalyzeBatchTracksInputSchema,
  AudioAnalysisResultSchema,
} from './schemas'
import { analyzeTrackUseCase, analyzeBatchTracksUseCase } from '../application'
import { AudioAnalysisServiceLive } from '../infrastructure'
import {
  AnalysisError,
  AudioFetchError,
  FeatureExtractionError,
} from '../domain'

const t = initTRPC.create()

const mapErrorToTRPC = (error: unknown): TRPCError => {
  if (error instanceof AnalysisError) {
    return new TRPCError({
      code: 'INTERNAL_SERVER_ERROR',
      message: error.message,
      cause: error.cause,
    })
  }

  if (error instanceof AudioFetchError) {
    return new TRPCError({
      code: 'BAD_REQUEST',
      message: error.message,
      cause: error.cause,
    })
  }

  if (error instanceof FeatureExtractionError) {
    return new TRPCError({
      code: 'INTERNAL_SERVER_ERROR',
      message: error.message,
      cause: error.cause,
    })
  }

  return new TRPCError({
    code: 'INTERNAL_SERVER_ERROR',
    message: 'Unknown error occurred during audio analysis',
    cause: error,
  })
}

export const audioAnalysisRouter = t.router({
  analyzeTrack: t.procedure
    .meta({
      openapi: {
        method: 'POST',
        path: '/audio/analyze',
        tags: ['Audio Analysis'],
        summary: 'Analyze audio features from a track URL',
        description:
          'Extract audio features (energy, danceability, valence, tempo, etc.) from a track URL',
      },
    })
    .input(AnalyzeTrackInputSchema)
    .output(AudioAnalysisResultSchema)
    .mutation(async ({ input }) => {
      const useCase = await Effect.runPromise(
        analyzeTrackUseCase.pipe(Effect.provide(AudioAnalysisServiceLive))
      )

      const result = await Effect.runPromise(
        useCase
          .execute(input.url)
          .pipe(
            Effect.provide(AudioAnalysisServiceLive),
            Effect.provide(NodeHttpClient.layerUndici),
            Effect.mapError(mapErrorToTRPC)
          )
      ).catch((error) => {
        throw error
      })

      return result
    }),

  analyzeBatch: t.procedure
    .meta({
      openapi: {
        method: 'POST',
        path: '/audio/analyze/batch',
        tags: ['Audio Analysis'],
        summary: 'Analyze audio features from multiple track URLs',
        description:
          'Extract audio features from multiple track URLs in batch (max 50 tracks)',
      },
    })
    .input(AnalyzeBatchTracksInputSchema)
    .output(z.array(AudioAnalysisResultSchema))
    .mutation(async ({ input }) => {
      const useCase = await Effect.runPromise(
        analyzeBatchTracksUseCase.pipe(Effect.provide(AudioAnalysisServiceLive))
      )

      const results = await Effect.runPromise(
        useCase
          .execute(input.urls)
          .pipe(
            Effect.provide(AudioAnalysisServiceLive),
            Effect.provide(NodeHttpClient.layerUndici),
            Effect.mapError(mapErrorToTRPC)
          )
      ).catch((error) => {
        throw error
      })

      return Array.from(results)
    }),

  health: t.procedure
    .meta({
      openapi: {
        method: 'GET',
        path: '/audio/health',
        tags: ['Audio Analysis'],
        summary: 'Health check for audio analysis service',
        description:
          'Check if the audio analysis service is available and ready',
      },
    })
    .input(z.void())
    .output(
      z.object({
        status: z.literal('ok'),
        service: z.literal('audio-analysis'),
        timestamp: z.string(),
      })
    )
    .query(() => ({
      status: 'ok' as const,
      service: 'audio-analysis' as const,
      timestamp: new Date().toISOString(),
    })),
})
