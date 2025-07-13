import { Effect, Layer } from 'effect'
import { Context } from 'effect'
import { promises as fs } from 'fs'
import { join } from 'path'
import { tmpdir } from 'os'
import { randomUUID } from 'crypto'

export interface TempFile {
  readonly path: string
  readonly cleanup: () => Effect.Effect<void, Error>
}

export interface TempFileService {
  readonly createTempFile: (
    extension?: string
  ) => Effect.Effect<TempFile, Error>
  
  readonly createTempFileWithContent: (
    content: ArrayBuffer,
    extension?: string
  ) => Effect.Effect<TempFile, Error>
  
  readonly cleanupAll: () => Effect.Effect<void, Error>
}

export const makeTempFileService = (): TempFileService => {
  const activePaths = new Set<string>()
  
  return {
    createTempFile: (extension = '.tmp') =>
      Effect.gen(function* () {
        const fileName = `${randomUUID()}${extension}`
        const filePath = join(tmpdir(), fileName)
        activePaths.add(filePath)
        
        const cleanup = () =>
          Effect.tryPromise({
            try: async () => {
              try {
                await fs.unlink(filePath)
                activePaths.delete(filePath)
              } catch (error) {
                // File might already be deleted, ignore error
                activePaths.delete(filePath)
              }
            },
            catch: (error) => error as Error,
          })
        
        return { path: filePath, cleanup }
      }),

    createTempFileWithContent: (content: ArrayBuffer, extension = '.tmp') =>
      Effect.gen(function* () {
        const fileName = `${randomUUID()}${extension}`
        const filePath = join(tmpdir(), fileName)
        activePaths.add(filePath)
        
        yield* Effect.tryPromise({
          try: () => fs.writeFile(filePath, new Uint8Array(content)),
          catch: (error) => error as Error,
        })
        
        const cleanup = () =>
          Effect.tryPromise({
            try: async () => {
              try {
                await fs.unlink(filePath)
                activePaths.delete(filePath)
              } catch (error) {
                // File might already be deleted, ignore error
                activePaths.delete(filePath)
              }
            },
            catch: (error) => error as Error,
          })
        
        return { path: filePath, cleanup }
      }),

    cleanupAll: () =>
      Effect.gen(function* () {
        const cleanupPromises = Array.from(activePaths).map(path =>
          fs.unlink(path).catch(() => {
            // Ignore errors for files that might already be deleted
          })
        )
        
        yield* Effect.tryPromise({
          try: () => Promise.all(cleanupPromises),
          catch: (error) => error as Error,
        })
        
        activePaths.clear()
      }),
  }
}

export const TempFileService = Context.GenericTag<TempFileService>(
  '@auto-playlist/TempFileService'
)

export const TempFileServiceLive = Layer.succeed(
  TempFileService,
  makeTempFileService()
)