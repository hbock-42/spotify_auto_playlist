import { initTRPC } from '@trpc/server'
import { OpenApiMeta } from 'trpc-openapi'
import { ZodError } from 'zod'

// Initialize tRPC with OpenAPI metadata support
export const t = initTRPC.meta<OpenApiMeta>().create({
  errorFormatter(opts) {
    const { shape, error } = opts
    return {
      ...shape,
      data: {
        ...shape.data,
        zodError:
          error.code === 'BAD_REQUEST' && error.cause instanceof ZodError
            ? error.cause.flatten()
            : null,
      },
    }
  },
})

// Export reusable router and procedure builders
export const createTRPCRouter = t.router
export const publicProcedure = t.procedure
