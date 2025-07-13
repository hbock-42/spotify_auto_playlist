import { z } from 'zod'
import { createTRPCRouter, publicProcedure } from './trpc'

// Health check response schema
const HealthResponse = z.object({
  status: z.literal('ok'),
  timestamp: z.string(),
  service: z.string(),
  version: z.string(),
})

// Version response schema
const VersionResponse = z.object({
  version: z.string(),
  name: z.string(),
  description: z.string(),
})

// Create the main app router
export const appRouter = createTRPCRouter({
  // Health check endpoint
  health: publicProcedure
    .meta({
      openapi: {
        method: 'GET',
        path: '/health',
        tags: ['System'],
        summary: 'Health check endpoint',
        description: 'Returns the current health status of the service',
      },
    })
    .input(z.void())
    .output(HealthResponse)
    .query(() => {
      return {
        status: 'ok' as const,
        timestamp: new Date().toISOString(),
        service: 'auto-playlist-backend',
        version: '1.0.0',
      }
    }),

  // Version endpoint
  version: publicProcedure
    .meta({
      openapi: {
        method: 'GET',
        path: '/version',
        tags: ['System'],
        summary: 'Get service version',
        description: 'Returns version information about the service',
      },
    })
    .input(z.void())
    .output(VersionResponse)
    .query(() => {
      return {
        version: '1.0.0',
        name: 'auto-playlist-backend',
        description:
          'Backend service for auto-playlist Flutter application providing audio analysis capabilities',
      }
    }),
})

export type AppRouter = typeof appRouter
