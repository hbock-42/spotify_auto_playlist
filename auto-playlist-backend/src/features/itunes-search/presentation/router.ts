import { initTRPC, TRPCError } from '@trpc/server'
import { Effect } from 'effect'
import { NodeHttpClient } from '@effect/platform-node'
import {
  TrackSearchQuerySchema,
  ITunesSearchResponseSchema,
} from './schemas'
import { 
  ITunesSearchWithCacheUseCase,
  ITunesSearchWithCacheUseCaseLive
} from '../application'
import { ITunesSearchServiceLive } from '../infrastructure'
import { 
  ITunesSearchError, 
  ITunesRateLimitError, 
  ITunesNoResultsError 
} from '../domain'

const t = initTRPC.create()

const mapErrorToTRPC = (error: unknown): TRPCError => {
  if (error instanceof ITunesSearchError) {
    return new TRPCError({
      code: 'INTERNAL_SERVER_ERROR',
      message: error.message,
      cause: error.cause,
    })
  }

  if (error instanceof ITunesRateLimitError) {
    return new TRPCError({
      code: 'TOO_MANY_REQUESTS',
      message: error.message,
    })
  }

  if (error instanceof ITunesNoResultsError) {
    return new TRPCError({
      code: 'NOT_FOUND',
      message: `No results found for "${error.query.title}" by "${error.query.artist}"`,
    })
  }

  return new TRPCError({
    code: 'INTERNAL_SERVER_ERROR',
    message: 'Unknown error occurred during iTunes search',
    cause: error,
  })
}

export const itunesSearchRouter = t.router({
  searchTrack: t.procedure
    .meta({
      openapi: {
        method: 'POST',
        path: '/itunes/search-track',
        tags: ['iTunes Search'],
        summary: 'Search for a track in iTunes',
        description: 'Search for a track by title and artist in iTunes API',
      },
    })
    .input(TrackSearchQuerySchema)
    .output(ITunesSearchResponseSchema)
    .mutation(async ({ input }) => {
      const useCase = await Effect.runPromise(
        ITunesSearchWithCacheUseCase.pipe(
          Effect.provide(ITunesSearchWithCacheUseCaseLive)
        )
      )

      const result = await Effect.runPromise(
        useCase.searchTrackWithCache(input).pipe(
          Effect.provide(ITunesSearchServiceLive),
          Effect.provide(NodeHttpClient.layerUndici),
          Effect.mapError(mapErrorToTRPC)
        )
      ).catch((error) => {
        throw error
      })

      return {
        track: result,
        attribution: 'provided courtesy of iTunes' as const,
      }
    }),
})