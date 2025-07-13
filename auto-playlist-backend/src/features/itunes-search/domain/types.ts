import { Data } from 'effect'

export interface ITunesTrackResult {
  readonly trackId: number
  readonly trackName: string
  readonly artistName: string
  readonly previewUrl: string
  readonly trackTimeMillis: number
  readonly artworkUrl100: string
  readonly primaryGenreName: string
  readonly releaseDate: string
  readonly collectionName: string
}

export interface ITunesSearchResponse {
  readonly resultCount: number
  readonly results: readonly ITunesTrackResult[]
}

export interface TrackSearchQuery {
  readonly title: string
  readonly artist: string
}

export class ITunesSearchError extends Data.TaggedError('ITunesSearchError')<{
  readonly message: string
  readonly cause?: unknown
}> {}

export class ITunesRateLimitError extends Data.TaggedError('ITunesRateLimitError')<{
  readonly message: string
  readonly retryAfter?: number
}> {}

export class ITunesNoResultsError extends Data.TaggedError('ITunesNoResultsError')<{
  readonly query: TrackSearchQuery
}> {}