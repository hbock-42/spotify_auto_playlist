# Auto Playlist Monorepo

This monorepo contains the complete Auto Playlist application ecosystem:

## Projects

### `spotify_auto_playlist/`
Flutter mobile application for creating intelligent playlists using AI-powered audio analysis.

**Tech Stack:**
- Flutter/Dart
- Spotify Web API
- Riverpod for state management
- Clean Architecture

### `auto-playlist-backend/`
TypeScript backend service providing audio analysis capabilities.

**Tech Stack:**
- Node.js/TypeScript
- tRPC with OpenAPI
- Supabase (PostgreSQL)
- Essentia.js for audio feature extraction
- iTunes Search API integration

## Getting Started

Each project has its own development setup. See individual README files in each project directory for specific instructions.

## Architecture

```
┌─────────────────────────┐    ┌──────────────────────────┐
│   Flutter Frontend      │    │   TypeScript Backend     │
│  (spotify_auto_playlist)│────│ (auto-playlist-backend)  │
└─────────────────────────┘    └──────────────────────────┘
            │                              │
            │                              │
            ▼                              ▼
   ┌─────────────────┐           ┌─────────────────┐
   │  Spotify API    │           │  iTunes API +   │
   │                 │           │  Essentia.js    │
   └─────────────────┘           └─────────────────┘
```

The backend replaces the deprecated Spotify Audio Features API, providing intelligent audio analysis for playlist creation.