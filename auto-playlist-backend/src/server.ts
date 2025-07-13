import 'dotenv/config'
import { HttpRouter, HttpServer, HttpServerResponse } from '@effect/platform'
import { NodeHttpServer, NodeRuntime } from '@effect/platform-node'
import { Effect, Layer, Logger, LogLevel } from 'effect'
import { createServer } from 'node:http'
import { generateOpenApiDocument } from 'trpc-openapi'
import { appConfig } from './shared/config'
import { appRouter } from './shared/http/router'

// Generate OpenAPI document
const openApiDocument = generateOpenApiDocument(appRouter, {
  title: 'Auto Playlist Backend API',
  description:
    'Backend service for auto-playlist Flutter application providing audio analysis capabilities',
  version: '1.0.0',
  baseUrl: 'http://localhost:3001/api',
})

// Create router with OpenAPI JSON and Swagger UI
const apiRouter = HttpRouter.empty.pipe(
  // Serve OpenAPI JSON document
  HttpRouter.get(
    '/openapi.json',
    Effect.succeed(openApiDocument).pipe(
      Effect.flatMap((doc) => HttpServerResponse.json(doc))
    )
  ),

  // Serve Swagger UI
  HttpRouter.get(
    '/docs',
    Effect.succeed(
      `
      <!DOCTYPE html>
      <html>
        <head>
          <title>Auto Playlist Backend API Documentation</title>
          <link rel="stylesheet" type="text/css" href="https://unpkg.com/swagger-ui-dist@5.9.0/swagger-ui.css" />
        </head>
        <body>
          <div id="swagger-ui"></div>
          <script src="https://unpkg.com/swagger-ui-dist@5.9.0/swagger-ui-bundle.js"></script>
          <script>
            SwaggerUIBundle({
              url: '/openapi.json',
              dom_id: '#swagger-ui',
              presets: [
                SwaggerUIBundle.presets.apis,
                SwaggerUIBundle.presets.standalone
              ]
            });
          </script>
        </body>
      </html>
    `
    ).pipe(Effect.flatMap((html) => HttpServerResponse.html(html)))
  ),

  // Serve ReDoc UI
  HttpRouter.get(
    '/redoc',
    Effect.succeed(
      `
      <!DOCTYPE html>
      <html>
        <head>
          <title>Auto Playlist Backend API Documentation - ReDoc</title>
          <meta charset="utf-8"/>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700|Roboto:300,400,700" rel="stylesheet">
          <style>
            body { margin: 0; padding: 0; }
          </style>
        </head>
        <body>
          <redoc spec-url="/openapi.json"></redoc>
          <script src="https://cdn.jsdelivr.net/npm/redoc@2.1.3/bundles/redoc.standalone.js"></script>
        </body>
      </html>
    `
    ).pipe(Effect.flatMap((html) => HttpServerResponse.html(html)))
  ),

  // Serve API endpoints directly through tRPC procedures
  HttpRouter.get(
    '/api/health',
    Effect.succeed({
      status: 'ok' as const,
      timestamp: new Date().toISOString(),
      service: 'auto-playlist-backend',
      version: '1.0.0',
    }).pipe(Effect.flatMap((response) => HttpServerResponse.json(response)))
  ),

  HttpRouter.get(
    '/api/version',
    Effect.succeed({
      version: '1.0.0',
      name: 'auto-playlist-backend',
      description:
        'Backend service for auto-playlist Flutter application providing audio analysis capabilities',
    }).pipe(Effect.flatMap((response) => HttpServerResponse.json(response)))
  )
)

// Create the main application
const app = apiRouter.pipe(HttpServer.serve(), HttpServer.withLogAddress)

// Create the server layer
const ServerLive = Layer.unwrapEffect(
  Effect.gen(function* () {
    const config = yield* appConfig
    const baseUrl = `http://localhost:${config.server.port}`

    const layer = NodeHttpServer.layer(() => createServer(), {
      port: config.server.port,
      host: config.server.host,
    })

    // Add startup messages after the server layer is created
    yield* Effect.logInfo(`🚀 Auto Playlist Backend API started`)
    yield* Effect.logInfo(`📖 Swagger UI: ${baseUrl}/docs`)
    yield* Effect.logInfo(`📚 ReDoc: ${baseUrl}/redoc`)
    yield* Effect.logInfo(`🔍 OpenAPI Spec: ${baseUrl}/openapi.json`)
    yield* Effect.logInfo(`❤️ Health Check: ${baseUrl}/api/health`)

    return layer
  })
)

// Main program
const program = Layer.launch(Layer.provide(app, ServerLive)).pipe(
  Effect.provide(Logger.pretty),
  Logger.withMinimumLogLevel(LogLevel.Info)
)

// Run the application
NodeRuntime.runMain(program)
