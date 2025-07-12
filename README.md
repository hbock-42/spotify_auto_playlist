<!--ts-->
* [spotify_auto_playlist](#spotify_auto_playlist)
   * [Getting Started](#getting-started)
      * [Prerequisites](#prerequisites)
      * [Installation](#installation)
   * [Asset Management](#asset-management)
      * [Generating Assets](#generating-assets)
      * [Usage](#usage)
<!--te-->

# spotify_auto_playlist

A Flutter application that analyzes your Spotify playlists using LLM and creates auto-generated playlists.

## Getting Started

This project uses Flutter with Clean Architecture principles and several productivity tools:

- **Flutter Version**: 3.32.5 (managed via FVM)
- **State Management**: Riverpod with Flutter Hooks
- **Asset Management**: flutter_gen for type-safe asset access
- **Build System**: Just for task automation

### Prerequisites

- Flutter SDK 3.32.5 (install via FVM)
- Just command runner
- Dart/Flutter development environment
- Ollama (for local LLM backend)

### Installation

1. Install dependencies:
   ```bash
   just flutter pub get
   ```

2. Generate assets:
   ```bash
   just flutter-gen
   ```

3. Set up Ollama for local LLM backend:
   ```bash
   # Install Ollama on macOS (requires macOS 12 Monterey or later)
   # Download from: https://ollama.com/download/Ollama.dmg
   # Install the .dmg file normally
   
   # Install a model for music analysis (choose one)
   ollama pull llama3.1:8b    # Recommended - good balance of speed/quality
   ollama pull mistral:7b     # Alternative - faster, slightly lower quality
   
   # Start Ollama service (runs on http://localhost:11434)
   ollama serve
   ```

4. Run the application:
   ```bash
   just flutter run
   ```

## Asset Management

This project uses [flutter_gen](https://pub.dev/packages/flutter_gen) for type-safe asset management.

### Generating Assets

After adding new assets to `pubspec.yaml`, run:
```bash
just flutter-gen
# or
just fg
```

This will generate type-safe asset classes in `lib/gen/` directory.

### Usage

Access your assets through generated classes:
```dart
// For assets in assets/config/
Assets.config.configLocal  // Returns the asset path
```
