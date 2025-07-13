import { Context, Effect } from 'effect'
import { HttpClient } from '@effect/platform'
import {
  ITunesTrackResult,
  TrackSearchQuery,
  ITunesSearchError,
  ITunesRateLimitError,
  ITunesNoResultsError,
} from './types'

export interface ITunesSearchService {
  readonly searchTrack: (
    query: TrackSearchQuery
  ) => Effect.Effect<
    ITunesTrackResult,
    ITunesSearchError | ITunesNoResultsError,
    HttpClient.HttpClient
  >
  
  readonly searchTracks: (
    queries: readonly TrackSearchQuery[]
  ) => Effect.Effect<
    readonly ITunesTrackResult[],
    ITunesSearchError | ITunesNoResultsError,
    HttpClient.HttpClient
  >
}

export const ITunesSearchService = Context.GenericTag<ITunesSearchService>(
  '@auto-playlist/ITunesSearchService'
)