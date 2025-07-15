import { Effect, Layer, Context } from 'effect'
import { HttpClient } from '@effect/platform'
import { 
  ITunesSearchService,
  TrackSearchQuery,
  ITunesTrackResult,
  ITunesSearchError,
  ITunesNoResultsError,
} from '../domain'

export interface ITunesSearchWithCacheUseCase {
  readonly searchTrackWithCache: (
    query: TrackSearchQuery
  ) => Effect.Effect<
    ITunesTrackResult,
    ITunesSearchError | ITunesNoResultsError,
    ITunesSearchService | HttpClient.HttpClient
  >
}

export const makeITunesSearchWithCacheUseCase = (): ITunesSearchWithCacheUseCase => ({
  searchTrackWithCache: (query: TrackSearchQuery) =>
    Effect.gen(function* () {
      const itunesService = yield* ITunesSearchService
      
      // For now, just search iTunes directly
      // TODO: Add database caching in the next implementation
      const itunesResult = yield* itunesService.searchTrack(query)
      return itunesResult
    }),
})

export const ITunesSearchWithCacheUseCase = Context.GenericTag<ITunesSearchWithCacheUseCase>(
  '@auto-playlist/ITunesSearchWithCacheUseCase'
)

export const ITunesSearchWithCacheUseCaseLive = Layer.succeed(
  ITunesSearchWithCacheUseCase,
  makeITunesSearchWithCacheUseCase()
)