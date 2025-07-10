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
   * [Technical Decisions Made](#technical-decisions-made)
   * [Notes](#notes)
<!--te-->

# Spotify Auto Playlist - Development TODO

## Overview
Create a Flutter application that analyzes Spotify playlists using LLM and automatically generates new playlists based on song characteristics.

## Phase 1: Project Setup & Authentication
- [ ] Create Spotify App in Spotify Developer Dashboard
  - [ ] Note down Client ID and redirect URI
  - [ ] Configure OAuth scopes: `playlist-read-private`, `playlist-read-collaborative`, `playlist-modify-public`, `playlist-modify-private`
- [ ] Set up environment configuration
  - [ ] Create .env file for API keys
  - [ ] Add .env to .gitignore
- [ ] Implement Spotify OAuth2 authentication
  - [ ] Create auth service with PKCE flow
  - [ ] Handle redirect URLs for different platforms
  - [ ] Implement token storage using flutter_secure_storage
  - [ ] Handle token refresh logic

## Phase 2: Spotify Integration
- [ ] Create Spotify API service
  - [ ] Set up Dio HTTP client with interceptors
  - [ ] Implement error handling with fpdart
- [ ] Implement playlist fetching
  - [ ] GET /me/playlists endpoint
  - [ ] Handle pagination
- [ ] Implement track details fetching
  - [ ] GET /playlists/{id}/tracks
  - [ ] Include audio features if needed
- [ ] Implement playlist creation
  - [ ] POST /users/{user_id}/playlists
  - [ ] POST /playlists/{id}/tracks

## Phase 3: LLM Integration
- [ ] Choose and set up LLM service (OpenAI/Claude/etc)
  - [ ] Create API service
  - [ ] Handle API keys securely
- [ ] Design song analysis prompt template
  - [ ] Include: genre, instruments, mood, context (party, holidays, etc.)
  - [ ] Define structured JSON response format
- [ ] Implement batch song analysis
  - [ ] Handle rate limits
  - [ ] Implement retry logic
- [ ] Create classification system
  - [ ] Define classification categories
  - [ ] Implement classification storage

## Phase 4: Core Logic
- [ ] Create domain entities
  - [ ] Playlist entity
  - [ ] Track entity
  - [ ] SongClassification entity
  - [ ] PlaylistProposal entity
- [ ] Implement song grouping algorithm
  - [ ] Group by primary criteria
  - [ ] Handle multi-criteria grouping
- [ ] Generate playlist proposals
  - [ ] Create naming convention: `auto[criteria1 | criteria2]`
  - [ ] Calculate optimal playlist sizes
- [ ] Handle user selections
  - [ ] Track which proposals to create
  - [ ] Batch playlist creation

## Phase 5: UI Implementation
- [ ] Set up shadcn_ui components
- [ ] Create authentication screen
  - [ ] Spotify login button
  - [ ] Loading states
- [ ] Create playlist selection screen
  - [ ] Display user's playlists
  - [ ] Single selection (multi-selection for future)
- [ ] Create analysis progress screen
  - [ ] Show progress bar
  - [ ] Display current song being analyzed
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

## Technical Decisions Made
- **Architecture**: Clean Architecture with separation of concerns
- **State Management**: Riverpod (without code generation)
- **Error Handling**: fpdart for functional programming
- **UI**: shadcn_ui components
- **Authentication**: OAuth2 with PKCE
- **Storage**: flutter_secure_storage for sensitive data

## Notes
- Always validate TODO completion before marking as done
- Update this file when new requirements emerge
- Playlist naming format: `auto[criteria]` or `auto[criteria1 | criteria2]`
