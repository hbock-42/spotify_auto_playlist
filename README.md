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

### Installation

1. Install dependencies:
   ```bash
   just flutter pub get
   ```

2. Generate assets:
   ```bash
   just flutter-gen
   ```

3. Run the application:
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
