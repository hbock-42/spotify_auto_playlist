# Table of content

<!--ts-->
* [Table of content](#table-of-content)
* [CLAUDE.md](#claudemd)
   * [Project Overview](#project-overview)
   * [Development Commands](#development-commands)
   * [Project Structure (Feature-Based Clean Architecture)](#project-structure-feature-based-clean-architecture)
      * [Architecture Principles](#architecture-principles)
   * [Technology Stack](#technology-stack)
   * [TypeScript Configuration](#typescript-configuration)
   * [API Integration Details](#api-integration-details)
      * [Flutter App Integration](#flutter-app-integration)
      * [iTunes Search API](#itunes-search-api)
      * [Database Schema](#database-schema)
      * [Performance Targets](#performance-targets)
   * [Effect-ts Development Guidelines](#effect-ts-development-guidelines)
      * [Code Organization Patterns](#code-organization-patterns)
      * [Effect-ts Code Conventions](#effect-ts-code-conventions)
      * [tRPC Integration with Effect](#trpc-integration-with-effect)
   * [Notes](#notes)
   * [Claude Working Principles](#claude-working-principles)
<!--te-->

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a TypeScript-based backend project for an auto-playlist Flutter application. It provides audio analysis services by integrating iTunes Search API for 30-second preview URLs and Essentia.js for audio feature extraction. The backend replaces Spotify's deprecated Audio Features API and uses tRPC for API handling with OpenAPI generation.

**Main Purpose**: Analyze audio features (energy, danceability, valence, tempo, acousticness) from iTunes preview URLs to help the Flutter app create intelligent playlists.

## Development Commands

- **Development server**: `pnpm dev` - Runs the development server using ts-node
- **Build**: `pnpm build` - Compiles TypeScript to JavaScript in dist/ directory
- **Start production**: `pnpm start` - Runs the compiled JavaScript from dist/
- **Generate OpenAPI**: `pnpm generate-openapi` - Generates OpenAPI documentation
- **Package manager**: Uses pnpm (version 10.13.1)

## Project Structure (Feature-Based Clean Architecture)

The project follows a feature-based clean architecture pattern with Effect-ts functional programming principles:

```
src/
├── server.ts                    # Main server entry point with Effect runtime
├── generate-openapi.ts          # OpenAPI documentation generator
├── shared/                      # Shared infrastructure and utilities
│   ├── config/                  # Environment configuration using Effect Config
│   ├── database/                # Database connection and migrations
│   ├── http/                    # HTTP server setup and middleware
│   └── utils/                   # Common utilities and helpers
├── features/                    # Feature-based modules
│   ├── audio-analysis/          # Audio feature extraction feature
│   │   ├── domain/              # Business logic and entities
│   │   ├── infrastructure/      # External service integrations
│   │   ├── application/         # Use cases and orchestration
│   │   └── presentation/        # tRPC routers and validation
│   ├── itunes-search/           # iTunes API integration feature
│   │   ├── domain/
│   │   ├── infrastructure/
│   │   ├── application/
│   │   └── presentation/
│   └── track-management/        # Track metadata and caching feature
│       ├── domain/
│       ├── infrastructure/
│       ├── application/
│       └── presentation/
└── types/                       # Global TypeScript type definitions
```

### Architecture Principles

- **Feature-based organization**: Each feature encapsulates its own domain, application logic, infrastructure, and presentation layers
- **Clean Architecture**: Dependencies point inward - domain layer has no external dependencies
- **Effect-ts patterns**: Leverage Effect for type-safe error handling, dependency injection, and functional composition
- **Domain-driven design**: Each feature represents a bounded context with clear boundaries
- **Separation of concerns**: Clear separation between business logic, infrastructure, and presentation

## Technology Stack

- **Runtime**: Node.js with TypeScript and Effect-ts
- **Functional Framework**: Effect-ts for type-safe functional programming
- **API Framework**: tRPC v10 with OpenAPI integration
- **Database**: Supabase (PostgreSQL) with sqlc for type-safe queries
- **Audio Analysis**: Essentia.js for feature extraction
- **External API**: iTunes Search API for 30-second preview URLs
- **Validation**: Zod v3 for schema validation and Effect integration
- **Build**: TypeScript compiler targeting ES2020
- **Development**: ts-node for direct TypeScript execution
- **HTTP Platform**: @effect/platform for HTTP server and client
- **HTTP Client**: @effect/platform HTTP client for iTunes API and audio streaming

## TypeScript Configuration

- **Target**: ES2020
- **Module**: CommonJS
- **Strict mode**: Enabled
- **Source directory**: `src/`
- **Output directory**: `dist/`

## API Integration Details

### Flutter App Integration
- **Input**: Receives track metadata (title, artist) from Flutter app
- **Output**: Returns audio features (energy, danceability, valence, tempo, acousticness)
- **Endpoints**: tRPC procedures for single track and batch analysis

### iTunes Search API
- **Rate Limit**: ~20 calls/minute (implement caching and rate limiting)
- **Attribution**: Must include "provided courtesy of iTunes" 
- **Usage**: Search by track title + artist to get 30-second preview URLs
- **Format**: Returns AAC audio files from Apple's CDN

### Database Schema
- **tracks**: Store track metadata and iTunes IDs
- **audio_features**: Store extracted audio features  
- **analysis_cache**: Cache iTunes search results and analysis
- **Use sqlc**: Generate type-safe queries with sqlc and sqlc-gen-typescript

### Performance Targets
- **Single track**: < 2 seconds analysis time
- **Batch processing**: 50 tracks in ~4 minutes
- **Cache hits**: < 100ms response time

## Effect-ts Development Guidelines

### Code Organization Patterns

- **Services**: Define interfaces in domain layer, implement in infrastructure
- **Effects**: Use Effect.gen for readable async workflows
- **Error Handling**: Define typed errors with tagged union types
- **Configuration**: Use Effect Config for environment variables
- **Dependency Injection**: Use Layer.provide for service composition
- **Resource Management**: Use Effect.acquireRelease for cleanup

### Effect-ts Code Conventions

```typescript
// Service definition (domain layer)
export interface AudioAnalysisService {
  readonly analyzeTrack: (url: string) => Effect.Effect<AudioFeatures, AnalysisError>
}

// Service implementation (infrastructure layer)
export class EssentiaAudioAnalysisService implements AudioAnalysisService {
  analyzeTrack = (url: string) => Effect.gen(function* () {
    // Implementation using Effect.gen
  })
}

// Error types (domain layer)
export class AnalysisError extends Data.TaggedError("AnalysisError")<{
  readonly message: string
  readonly cause?: unknown
}> {}

// Layer composition (main.ts)
const AudioAnalysisServiceLive = Layer.succeed(
  AudioAnalysisService,
  new EssentiaAudioAnalysisService()
)
```

### tRPC Integration with Effect

- **Procedures**: Return Effect types from tRPC procedures
- **Context**: Provide Effect services through tRPC context
- **Error Mapping**: Map Effect errors to tRPC errors
- **Middleware**: Use Effect middleware for logging, auth, etc.

## Notes

- Project follows feature-based clean architecture with Effect-ts
- Replaces deprecated Spotify Audio Features API (deprecated Nov 2024)
- Intelligent caching essential due to iTunes API rate limits
- Uses pnpm for package management and Effect-ts for functional programming

## Claude Working Principles

- When you are about to do a big task, use sequential-thinking mcp
- **Always verify library documentation**: Use context7 MCP to check the latest documentation for any library before implementation
- **Follow Clean Architecture**: Keep domain logic pure, infrastructure at the edges
- **Use Effect patterns**: Leverage Effect.gen, Layer, and typed errors consistently
- **Always run `just check` before thinking you have finish a task**