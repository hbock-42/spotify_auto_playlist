import { Context, Effect } from 'effect'
import { HttpClient } from '@effect/platform'
import { ITunesSearchError } from './types'

export interface AudioStreamService {
  readonly downloadAudioBuffer: (
    url: string
  ) => Effect.Effect<
    ArrayBuffer,
    ITunesSearchError,
    HttpClient.HttpClient
  >
  
  readonly streamAudio: (
    url: string
  ) => Effect.Effect<
    ReadableStream<Uint8Array>,
    ITunesSearchError,
    HttpClient.HttpClient
  >
}

export const AudioStreamService = Context.GenericTag<AudioStreamService>(
  '@auto-playlist/AudioStreamService'
)