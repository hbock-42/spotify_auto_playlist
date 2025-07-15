import { Effect } from 'effect'
import { HttpClient } from '@effect/platform'
import {
  ITunesSearchService,
  ITunesTrackResult,
  TrackSearchQuery,
  ITunesSearchResponse,
  ITunesSearchError,
  ITunesNoResultsError,
} from '../domain'

export class SimpleITunesAPIService implements ITunesSearchService {
  searchTrack = (query: TrackSearchQuery): Effect.Effect<
    ITunesTrackResult,
    ITunesSearchError | ITunesNoResultsError,
    HttpClient.HttpClient
  > =>
    Effect.gen(function* () {
      const searchTerm = `${query.title} ${query.artist}`.trim()
      const url = new URL('https://itunes.apple.com/search')
      url.searchParams.set('term', searchTerm)
      url.searchParams.set('media', 'music')
      url.searchParams.set('entity', 'song')
      url.searchParams.set('limit', '5')
      url.searchParams.set('explicit', 'no')

      const httpClient = yield* HttpClient.HttpClient

      const response = yield* httpClient.get(url.toString()).pipe(
        Effect.flatMap((response) => response.json),
        Effect.catchAll((error) =>
          Effect.fail(
            new ITunesSearchError({
              message: 'iTunes API request failed',
              cause: error,
            })
          )
        )
      )

      const searchResponse = response as ITunesSearchResponse

      if (searchResponse.resultCount === 0) {
        return yield* Effect.fail(
          new ITunesNoResultsError({
            query,
          })
        )
      }

      // Return the first result for simplicity
      const firstResult = searchResponse.results[0]
      if (!firstResult) {
        return yield* Effect.fail(
          new ITunesNoResultsError({
            query,
          })
        )
      }

      return firstResult
    })

  searchTracks = (queries: readonly TrackSearchQuery[]): Effect.Effect<
    readonly ITunesTrackResult[],
    ITunesSearchError | ITunesNoResultsError,
    HttpClient.HttpClient
  > => {
    const searchTrackMethod = this.searchTrack.bind(this)
    
    return Effect.gen(function* () {
      const results: ITunesTrackResult[] = []
      
      for (const query of queries) {
        const result = yield* Effect.either(searchTrackMethod(query))
        
        if (result._tag === 'Right') {
          results.push(result.right)
        }
      }
      
      return results
    })
  }
}