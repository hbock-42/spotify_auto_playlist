# Table of content

<!--ts-->
* [Table of content](#table-of-content)
* [Auto Playlist Backend - Development TODO](#auto-playlist-backend---development-todo)
   * [Overview](#overview)
   * [Phase 1: Project Foundation](#phase-1-project-foundation)
   * [Phase 2: Database Schema Design](#phase-2-database-schema-design)
   * [Phase 3: Audio Analysis Service](#phase-3-audio-analysis-service)
   * [Phase 4: iTunes API Integration &amp; Audio Processing](#phase-4-itunes-api-integration--audio-processing)
   * [Phase 5: API Endpoints](#phase-5-api-endpoints)
   * [Phase 6: Performance &amp; Optimization](#phase-6-performance--optimization)
   * [Phase 7: Production Readiness](#phase-7-production-readiness)
   * [Technical Stack](#technical-stack)
   * [Integration Points](#integration-points)
   * [Performance Targets](#performance-targets)
   * [Notes](#notes)
<!--te-->

# Auto Playlist Backend - Development TODO

## Overview
Node.js/TypeScript backend for the auto-playlist Flutter application. Provides audio analysis services using Essentia.js and manages data persistence with Supabase/PostgreSQL.

## Phase 1: Project Foundation
- [x] Setup core backend infrastructure
  - [x] Configure tRPC with OpenAPI generation
  - [x] Setup Supabase database connection
  - [x] Configure sqlc for TypeScript generation
  - [x] Setup environment configuration
  - [x] Add input validation with Zod schemas

## Phase 2: Database Schema Design
- [x] Design PostgreSQL schema for audio features
  - [x] Create tracks table (id, spotify_id, title, artist, duration, etc.)
  - [x] Create audio_features table (track_id, energy, danceability, valence, tempo, etc.)
  - [x] Create analysis_cache table (spotify_id, features_json, analyzed_at)
  - [x] Add proper indexes for performance
- [x] Generate TypeScript types with sqlc
- [x] Implement database migrations

## Phase 3: Audio Analysis Service
- [x] Setup Essentia.js integration
  - [x] Install and configure Essentia.js
  - [x] Create audio analysis endpoints
  - [x] Implement feature extraction (energy, danceability, valence, tempo, acousticness)
  - [x] Add batch processing capabilities
  - [x] Create comprehensive test suite with Vitest (19 tests passing)
- [x] Create analysis caching system
  - [x] Check cache before analysis
  - [x] Store results in Supabase
  - [x] Implement cache invalidation strategy

## Phase 4: iTunes API Integration & Audio Processing
- [ ] Implement iTunes Search API integration
  - [ ] Search iTunes by track title and artist from Flutter app
  - [ ] Extract preview URLs from iTunes API responses
  - [ ] Handle rate limiting (20 calls/minute)
  - [ ] Implement caching for iTunes search results
- [ ] Implement audio download/streaming
  - [ ] Download/stream iTunes preview URLs (30-second AAC clips)
  - [ ] Support AAC and other iTunes formats
  - [ ] Temporary file management for processing
  - [ ] Add "provided courtesy of iTunes" attribution

## Phase 5: API Endpoints
- [ ] Implement tRPC procedures
  - [ ] `analyzeTrack` - Search iTunes and analyze single track by title/artist
  - [ ] `analyzeBatch` - Batch analyze multiple tracks with rate limiting
  - [ ] `getAudioFeatures` - Retrieve cached audio features
  - [ ] `getCacheStatus` - Check if tracks are already analyzed
- [ ] Add proper error handling and validation
- [ ] Generate OpenAPI documentation

## Phase 6: Performance & Optimization
- [ ] Implement concurrent processing
  - [ ] Queue system for batch analysis
  - [ ] Parallel audio processing
  - [ ] Progress tracking for long-running operations
- [ ] Add monitoring and logging
  - [ ] Request/response logging
  - [ ] Performance metrics
  - [ ] Error tracking

## Phase 7: Production Readiness
- [ ] Docker containerization
- [ ] Environment-specific configurations
- [ ] Health check endpoints
- [ ] Graceful shutdown handling
- [ ] Security headers and validation

## Technical Stack
- **Runtime**: Node.js with TypeScript
- **API Framework**: tRPC with OpenAPI integration  
- **Database**: Supabase (PostgreSQL)
- **ORM/Query Builder**: sqlc for type-safe SQL
- **Audio Analysis**: Essentia.js
- **Validation**: Zod schemas
- **HTTP Client**: node-fetch or axios for iTunes API and audio downloading

## Integration Points
- **Flutter App**: Sends track metadata (title, artist), consumes audio analysis results
- **iTunes Search API**: Provides 30-second preview URLs for audio analysis
- **Supabase**: Stores audio features, iTunes search results, and analysis cache
- **Essentia.js**: Performs audio feature extraction from iTunes preview URLs

## Performance Targets
- **Single track analysis**: < 2 seconds
- **Batch processing**: 50 tracks in ~4 minutes
- **Cache hit response**: < 100ms
- **Concurrent requests**: Support 10+ simultaneous analyses

## Notes
- Replace deprecated Spotify Audio Features API with iTunes + Essentia.js analysis
- iTunes API rate limit: ~20 calls/minute - implement intelligent caching
- Prioritize caching to avoid re-analyzing same tracks and iTunes searches
- Support both individual and batch analysis workflows with rate limiting
- Ensure type safety throughout with sqlc and Zod
- Include iTunes attribution: "provided courtesy of iTunes"