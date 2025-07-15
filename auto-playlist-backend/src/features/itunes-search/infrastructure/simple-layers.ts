import { Layer } from 'effect'
import { ITunesSearchService } from '../domain'
import { SimpleITunesAPIService } from './simple-itunes-service'

export const ITunesSearchServiceLive = Layer.succeed(
  ITunesSearchService,
  new SimpleITunesAPIService()
)