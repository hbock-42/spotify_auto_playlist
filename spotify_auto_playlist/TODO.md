# Table of content

<!--ts-->
* [Spotify Auto Playlist - Development TODO](#spotify-auto-playlist---development-todo)
   * [Overview](#overview)
   * [Phase 1: Project Setup &amp; Authentication](#phase-1-project-setup--authentication)
   * [Phase 2: Spotify Integration](#phase-2-spotify-integration)
   * [Phase 3: LLM Integration](#phase-3-llm-integration)
   * [Phase 4: Core Logic](#phase-4-core-logic)
   * [Phase 5: UI Implementation](#phase-5-ui-implementation)
   * [Phase 6: Polish &amp; Error Handling](#phase-6-polish--error-handling)
   * [Future Enhancements](#future-enhancements)
   * [Future](#future)
   * [Technical Decisions Made](#technical-decisions-made)
   * [Notes](#notes)
<!--te-->

# Spotify Auto Playlist - Development TODO

## Overview
Create a Flutter application that analyzes Spotify playlists using LLM and automatically generates new playlists based on song characteristics.

## Phase 1: Project Setup & Authentication
- [x] Create Spotify App in Spotify Developer Dashboard
  - [x] Note down Client ID and redirect URI
  - [x] `Configure` OAuth scopes: `playlist-read-private`, `playlist-read-collaborative`, `playlist-modify-public`, `playlist-modify-private`
- [x] Set up environment configuration
  - [x] Create JSON config file for non-sensitive values
  - [x] Add .env to .gitignore (already configured)
  - [x] Implement configuration service with freezed
  - [x] Add comprehensive tests for configuration validation
  - [x] Migrate to Feature-Based Clean Architecture
    - [x] Restructure project from layer-first to feature-first organization
    - [x] Create core/ directory for shared infrastructure
    - [x] Move auth code to features/auth/ directory
    - [x] Implement proper dependency injection with Riverpod providers
    - [x] Update ConfigService to ConfigLoader with provider-based config access
    - [x] Fix broken tests after ConfigLoader refactoring
- [x] Implement Spotify OAuth2 authentication
  - [x] Create auth service with PKCE flow
  - [x] Handle redirect URLs for different platforms
  - [x] Implement token storage using flutter_secure_storage
  - [x] Handle token refresh logic

## Phase 2: Spotify Integration
- [x] Create Spotify API service
  - [x] Set up Dio HTTP client with interceptors
  - [x] Implement error handling with fpdart
- [x] Implement playlist fetching
  - [x] GET /me/playlists endpoint
  - [x] Handle pagination
- [x] Implement track details fetching
  - [x] GET /playlists/{id}/tracks
  - [x] Include audio features if needed
- [x] Implement playlist creation
  - [x] POST /users/{user_id}/playlists
  - [x] POST /playlists/{id}/tracks

## Phase 3: LLM Integration
- [x] Choose and set up LLM service (Local Ollama with Llama 3.1 8B)
  - [x] Install Ollama on macOS (via .dmg installer)
  - [x] Pull and test Llama 3.1 8B model
  - [x] Verify API endpoint (localhost:11434) working
- [x] Create Flutter LLM service
  - [x] Set up Dio HTTP client for Ollama API
  - [x] Follow existing Spotify API patterns (error handling with fpdart)
  - [x] Implement basic song analysis endpoint
- [x] Design optimized song analysis approach
  - [x] Use Spotify metadata + audio features (no actual audio processing)
  - [x] Input: title, artist, genres, energy, danceability, valence, tempo, acousticness
  - [x] Output: structured JSON with mood, context, style classifications
  - [x] Target: 2-5 seconds per song (vs 50+ seconds with full analysis)
- [x] Implement batch song analysis
  - [x] Parallel processing (2-4 concurrent requests on M1 32GB)
  - [x] Progress tracking and pause/resume functionality
  - [x] Rate limiting and retry logic
  - [x] Performance target: ~4 minutes for 50 songs, ~20 minutes for 1000 songs
- [x] Create classification system
  - [x] Define classification categories (mood, context, style)
  - [x] Implement classification storage

## Phase 4: Core Logic
- [x] Create domain entities
  - [x] Playlist entity
  - [x] Track entity  
  - [x] SongClassification entity
  - [x] PlaylistProposal entity
- [x] Implement song grouping algorithm
  - [x] Group by primary criteria
  - [x] Handle multi-criteria grouping
- [x] Generate playlist proposals
  - [x] Create naming convention: `auto[criteria1 | criteria2]`
  - [x] Calculate optimal playlist sizes
- [x] Handle user selections
  - [x] Track which proposals to create
  - [x] Batch playlist creation

## Phase 5: UI Implementation
- [x] Set up shadcn_ui components
- [x] Create authentication screen
  - [x] Spotify login button
  - [x] Loading states
- [x] Create playlist selection screen
  - [x] Display user's playlists with images and metadata
  - [x] Single selection (multi-selection for future)
  - [x] Handle empty playlists state
  - [x] Error handling and loading states
- [x] Create analysis progress screen UI structure
  - [x] Show progress bar and percentage
  - [x] Display current song being analyzed
  - [x] Analysis control buttons (pause/resume/cancel)
  - [x] Progress statistics (completed/remaining/failed)
  - [x] Different states (idle/running/paused/completed/error)
- [x] **Implement actual analysis functionality**
  - [x] Connect analysis screen to real Spotify playlist fetching
  - [x] Implement track-by-track LLM analysis with progress updates
  - [x] Handle pause/resume/cancel functionality
  - [x] Transition to completed state when analysis finishes
  - [x] Add Spotify Audio Features API integration
  - [ ] **CRITICAL: Replace deprecated Spotify Audio Features endpoint**
    - [ ] Research and implement external audio analysis solution
    - [ ] Design Node.js backend with Essentia.js for audio analysis
    - [ ] Set up Supabase database for caching audio features
    - [ ] Create REST API endpoints for audio analysis
    - [ ] Update Flutter client to use new audio analysis backend
    - [ ] Migrate existing audio features integration
  - [x] Create AnalysisService for orchestrating the full workflow
  - [x] Implement real-time progress tracking via streams
  - [x] Add proper error handling with typed failures
  - [x] Fix all analyzer issues and ensure code quality
- [ ] Create playlist proposals screen
  - [ ] List proposed playlists with song counts
  - [ ] Preview songs in each proposal
  - [ ] Multi-select for creation
- [ ] Create confirmation/results screen
  - [ ] Show created playlists
  - [ ] Link to open in Spotify

## Phase 6: Polish & Error Handling
- [ ] Implement comprehensive error handling
  - [ ] Network errors
  - [ ] API rate limits
  - [ ] Invalid responses
- [ ] Add loading states throughout
- [ ] Implement proper state management with Riverpod
- [ ] Add user feedback (toasts/snackbars)
- [ ] Test on multiple platforms

## Future Enhancements
- [ ] Multiple source playlist selection
- [ ] Custom classification criteria
- [ ] Playlist editing before creation
- [ ] Scheduled auto-updates
- [ ] Export/import classification data

## Future
- [ ] Secure storage https://pub.dev/packages/flutter_secure_storage#configure-macos-version
  - [x] macos 
  - [ ] ios
  - [ ] android
  - [ ] linux
  - [ ] web
  - [ ] windows

## Technical Decisions Made
- **Architecture**: Feature-Based Clean Architecture (3-layer: domain, data, presentation)
- **Organization**: Feature-first structure with shared core infrastructure
- **State Management**: Riverpod (without code generation) with proper dependency injection
- **Error Handling**: fpdart for functional programming
- **UI**: shadcn_ui components
- **Authentication**: OAuth2 with PKCE
- **Storage**: flutter_secure_storage for sensitive data
- **Configuration**: Provider-based config injection instead of static access

## Notes
- Always validate TODO completion before marking as done
- Update this file when new requirements emerge
- Playlist naming format: `auto[criteria]` or `auto[criteria1 | criteria2]`
