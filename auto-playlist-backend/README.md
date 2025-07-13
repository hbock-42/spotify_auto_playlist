# Table of content

<!--ts-->
* [Table of content](#table-of-content)
* [Auto Playlist Backend](#auto-playlist-backend)
   * [🎯 Purpose](#-purpose)
   * [🏗️ Architecture](#️-architecture)
      * [Architecture Principles](#architecture-principles)
   * [🛠️ Technology Stack](#️-technology-stack)
   * [🚀 Quick Start](#-quick-start)
      * [Prerequisites](#prerequisites)
      * [Installation](#installation)
      * [Environment Configuration](#environment-configuration)
      * [Development](#development)
   * [📊 API Integration](#-api-integration)
      * [Flutter App Integration](#flutter-app-integration)
      * [iTunes Search API](#itunes-search-api)
      * [Database Schema](#database-schema)
   * [🎯 Performance Targets](#-performance-targets)
   * [🔧 Development Guidelines](#-development-guidelines)
      * [Effect-ts Patterns](#effect-ts-patterns)
      * [Code Organization](#code-organization)
   * [📋 Project Status](#-project-status)
   * [🔄 Migration from Spotify](#-migration-from-spotify)
   * [📝 License](#-license)
   * [🤝 Contributing](#-contributing)
   * [📞 Support](#-support)
<!--te-->

# Auto Playlist Backend

A TypeScript backend service for the auto-playlist Flutter application that provides intelligent audio analysis capabilities. This service replaces Spotify's deprecated Audio Features API by combining iTunes Search API with Essentia.js for audio feature extraction.

## 🎯 Purpose

Analyze audio features (energy, danceability, valence, tempo, acousticness) from iTunes 30-second preview URLs to help create intelligent playlists.

## 🏗️ Architecture

This project follows a **feature-based clean architecture** pattern using **Effect-ts** for functional programming:

```
src/
├── server.ts                    # Main server entry point
├── generate-openapi.ts          # OpenAPI documentation generator
├── shared/                      # Shared infrastructure
│   ├── config/                  # Environment configuration
│   ├── database/                # Database connection and migrations
│   ├── http/                    # HTTP server setup and middleware
│   └── utils/                   # Common utilities
├── features/                    # Feature-based modules
│   ├── audio-analysis/          # Audio feature extraction
│   ├── itunes-search/           # iTunes API integration
│   └── track-management/        # Track metadata and caching
└── types/                       # Global TypeScript definitions
```

### Architecture Principles

- **Feature-based organization**: Each feature is self-contained with its own layers
- **Clean Architecture**: Dependencies point inward, domain logic is pure
- **Effect-ts patterns**: Type-safe error handling, dependency injection, functional composition
- **Domain-driven design**: Clear bounded contexts with well-defined interfaces

## 🛠️ Technology Stack

- **Runtime**: Node.js with TypeScript
- **Functional Framework**: Effect-ts for type-safe functional programming
- **API Framework**: tRPC v10 with OpenAPI integration
- **Database**: Supabase (PostgreSQL) with sqlc for type-safe queries
- **Audio Analysis**: Essentia.js for feature extraction
- **External API**: iTunes Search API for 30-second preview URLs
- **Validation**: Zod v3 for schema validation
- **HTTP Platform**: @effect/platform for server and client
- **Package Manager**: pnpm v10.13.1

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ 
- pnpm 10.13.1+
- sqlc CLI tool (install with `brew install sqlc`)
- PostgreSQL database (optional for basic testing)

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd auto-playlist-backend

# Install sqlc CLI tool (macOS)
brew install sqlc

# Install dependencies
pnpm install

# Copy environment configuration
cp .env.example .env

# Edit .env with your configuration
# At minimum, set DB_PASSWORD for database connection

# Generate type-safe database code (after setting up schema)
sqlc generate
```

### Environment Configuration

Required environment variables:

```bash
# Server
PORT=3000
HOST=0.0.0.0
NODE_ENV=development

# Database (Supabase/PostgreSQL)
DB_HOST=localhost
DB_PORT=5432
DB_NAME=auto_playlist
DB_USER=postgres
DB_PASSWORD=your_password_here
DB_SSL=false

# iTunes API
ITUNES_API_URL=https://itunes.apple.com/search
ITUNES_RATE_LIMIT=20
ITUNES_TIMEOUT_MS=5000

# Audio Analysis
AUDIO_TEMP_DIR=/tmp/audio
MAX_AUDIO_FILE_SIZE=10485760
ANALYSIS_TIMEOUT_MS=30000
```

### Development

```bash
# Generate type-safe database code
sqlc generate

# Start development server
pnpm dev

# Build for production
pnpm build

# Start production server
pnpm start

# Generate OpenAPI documentation
pnpm generate-openapi

# Run type checks and linting
pnpm check
```

The server will start on `http://localhost:3000` with a health check endpoint at `/health`.

## 📊 API Integration

### Flutter App Integration

- **Input**: Track metadata (title, artist) from Flutter app
- **Output**: Audio features (energy, danceability, valence, tempo, acousticness)
- **Endpoints**: tRPC procedures for single track and batch analysis

### iTunes Search API

- **Rate Limit**: ~20 calls/minute
- **Attribution**: Includes "provided courtesy of iTunes" 
- **Usage**: Search by track title + artist to get 30-second preview URLs
- **Format**: AAC audio files from Apple's CDN

### Database Schema

- **tracks**: Store track metadata and iTunes IDs
- **audio_features**: Store extracted audio features  
- **analysis_cache**: Cache iTunes search results and analysis

## 🎯 Performance Targets

- **Single track analysis**: < 2 seconds
- **Batch processing**: 50 tracks in ~4 minutes  
- **Cache hit response**: < 100ms
- **Concurrent requests**: Support 10+ simultaneous analyses

## 🔧 Development Guidelines

### Effect-ts Patterns

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

// Layer composition
const AudioAnalysisServiceLive = Layer.succeed(
  AudioAnalysisService,
  new EssentiaAudioAnalysisService()
)
```

### Code Organization

- **Services**: Define interfaces in domain, implement in infrastructure
- **Effects**: Use Effect.gen for readable async workflows
- **Error Handling**: Define typed errors with tagged union types
- **Configuration**: Use Effect Config for environment variables
- **Dependency Injection**: Use Layer.provide for service composition

## 📋 Project Status

This project is currently in the **foundation setup phase**. See [TODO.md](./TODO.md) for detailed implementation phases:

- ✅ **Phase 1**: Project Foundation (Complete)
- ⏳ **Phase 2**: Database Schema Design
- ⏳ **Phase 3**: Audio Analysis Service  
- ⏳ **Phase 4**: iTunes API Integration
- ⏳ **Phase 5**: API Endpoints
- ⏳ **Phase 6**: Performance & Optimization
- ⏳ **Phase 7**: Production Readiness

## 🔄 Migration from Spotify

This backend specifically addresses the deprecation of Spotify's Audio Features API (November 2024) by providing:

1. **iTunes Integration**: Access to 30-second preview URLs for analysis
2. **Essentia.js Analysis**: Client-side audio feature extraction
3. **Intelligent Caching**: Minimize API calls and analysis redundancy
4. **Rate Limiting**: Respect iTunes API limitations (~20 calls/minute)

## 📝 License

[Add your license information here]

## 🤝 Contributing

[Add contributing guidelines here]

## 📞 Support

For questions or issues:
- Check the [TODO.md](./TODO.md) for implementation roadmap
- Review [CLAUDE.md](./CLAUDE.md) for development guidance
- Create an issue in the repository