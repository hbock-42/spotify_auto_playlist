import { describe, it, expect } from 'vitest'
import { Effect, Context, Layer } from 'effect'

describe('Effect-ts Patterns', () => {
  describe('Effect.gen Usage', () => {
    it('should work with basic Effect.gen pattern', async () => {
      const testEffect = Effect.gen(function* () {
        const value = yield* Effect.succeed(42)
        const doubled = yield* Effect.succeed(value * 2)
        return doubled
      })

      const result = await Effect.runPromise(testEffect)
      expect(result).toBe(84)
    })

    it('should handle errors in Effect.gen', async () => {
      const testEffect = Effect.gen(function* () {
        const value = yield* Effect.succeed(10)
        if (value < 20) {
          yield* Effect.fail(new Error('Value too small'))
        }
        return value
      })

      await expect(Effect.runPromise(testEffect)).rejects.toThrow(
        'Value too small'
      )
    })

    it('should work with Effect.tryPromise', async () => {
      const testEffect = Effect.gen(function* () {
        const result = yield* Effect.tryPromise({
          try: () => Promise.resolve('success'),
          catch: (error) => new Error(`Promise failed: ${String(error)}`),
        })
        return result
      })

      const result = await Effect.runPromise(testEffect)
      expect(result).toBe('success')
    })
  })

  describe('Service Pattern', () => {
    interface TestService {
      readonly getValue: () => Effect.Effect<string, never>
    }

    const TestService = Context.GenericTag<TestService>('@test/TestService')

    class TestServiceImpl implements TestService {
      getValue = () => Effect.succeed('test-value')
    }

    const TestServiceLive = Layer.succeed(TestService, new TestServiceImpl())

    it('should work with service dependency injection', async () => {
      const testEffect = Effect.gen(function* () {
        const service = yield* TestService
        const value = yield* service.getValue()
        return value
      })

      const result = await Effect.runPromise(
        testEffect.pipe(Effect.provide(TestServiceLive))
      )
      expect(result).toBe('test-value')
    })

    it('should work with different service implementations', async () => {
      // Test that we can swap service implementations
      class AlternativeTestServiceImpl implements TestService {
        getValue = () => Effect.succeed('alternative-value')
      }

      const AlternativeTestServiceLive = Layer.succeed(
        TestService,
        new AlternativeTestServiceImpl()
      )

      const testEffect = Effect.gen(function* () {
        const service = yield* TestService
        const value = yield* service.getValue()
        return value
      })

      const result = await Effect.runPromise(
        testEffect.pipe(Effect.provide(AlternativeTestServiceLive))
      )
      expect(result).toBe('alternative-value')
    })
  })

  describe('Error Handling', () => {
    class CustomError extends Error {
      constructor(
        message: string,
        public readonly code: string
      ) {
        super(message)
        this.name = 'CustomError'
      }
    }

    it('should handle typed errors', async () => {
      const testEffect = Effect.gen(function* () {
        yield* Effect.fail(new CustomError('Test error', 'TEST_001'))
        return 'should not reach here'
      })

      const catchEffect = testEffect.pipe(
        Effect.catchAll((error) =>
          Effect.succeed({
            caught: true,
            message: error.message,
            code: error instanceof CustomError ? error.code : 'UNKNOWN',
          })
        )
      )

      const result = await Effect.runPromise(catchEffect)
      if (typeof result === 'object' && result !== null && 'caught' in result) {
        expect(result.caught).toBe(true)
        expect(result.message).toBe('Test error')
        expect(result.code).toBe('TEST_001')
      } else {
        throw new Error('Expected result to be an object with caught property')
      }
    })

    it('should transform errors', async () => {
      const testEffect = Effect.gen(function* () {
        yield* Effect.fail(new Error('Original error'))
        return 'success'
      })

      const transformEffect = testEffect.pipe(
        Effect.mapError(
          (error) =>
            new CustomError(`Transformed: ${error.message}`, 'TRANSFORM')
        )
      )

      await expect(Effect.runPromise(transformEffect)).rejects.toThrow(
        'Transformed: Original error'
      )
    })
  })

  describe('Resource Management', () => {
    it('should handle resource acquisition and release', async () => {
      let acquired = false
      let released = false

      const resource = Effect.acquireRelease(
        Effect.sync(() => {
          acquired = true
          return 'resource'
        }),
        () =>
          Effect.sync(() => {
            released = true
          })
      )

      const testEffect = Effect.gen(function* () {
        const res = yield* resource
        expect(acquired).toBe(true)
        expect(released).toBe(false)
        return res
      })

      const result = await Effect.runPromise(Effect.scoped(testEffect))
      expect(result).toBe('resource')
      expect(acquired).toBe(true)
      expect(released).toBe(true)
    })
  })
})
