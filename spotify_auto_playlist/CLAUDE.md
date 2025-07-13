# Table of content

<!--ts-->
* [CLAUDE.md](#claudemd)
   * [Project Overview](#project-overview)
   * [Development Environment](#development-environment)
   * [Essential Commands](#essential-commands)
      * [Running the Application](#running-the-application)
      * [Building the Application](#building-the-application)
      * [Testing and Quality Checks](#testing-and-quality-checks)
      * [Dependency Management](#dependency-management)
   * [Project Architecture](#project-architecture)
      * [Architecture Principles](#architecture-principles)
      * [Folder Structure](#folder-structure)
      * [Key Architectural Decisions](#key-architectural-decisions)
   * [Dependencies and Libraries](#dependencies-and-libraries)
      * [Core Dependencies](#core-dependencies)
      * [Development Dependencies](#development-dependencies)
   * [Code Standards](#code-standards)
      * [State Management](#state-management)
      * [Widget Design Principles](#widget-design-principles)
      * [Error Handling](#error-handling)
      * [Documentation and Dependencies](#documentation-and-dependencies)
      * [Code Quality](#code-quality)
      * [Logging Strategy](#logging-strategy)
      * [HTTP Client (Dio)](#http-client-dio)
      * [Asset Management (flutter_gen)](#asset-management-flutter_gen)
      * [Testing Standards](#testing-standards)
         * [General Testing Practices](#general-testing-practices)
         * [Widget Testing](#widget-testing)
         * [Integration Testing](#integration-testing)
   * [Key Configuration Files](#key-configuration-files)
   * [Future Development Notes](#future-development-notes)
   * [Workflow Memories](#workflow-memories)
<!--te-->


# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application project named "spotify_auto_playlist" that's currently in its initial setup phase with the default Flutter counter demo app. The project is configured for cross-platform development supporting mobile (iOS/Android), desktop (Windows/macOS/Linux), and web platforms.

## Development Environment

- **Flutter Version**: 3.32.5 (managed via FVM)
- **Dart SDK**: ^3.8.1
- **Platform**: Cross-platform Flutter application

## Essential Commands

### Running the Application
```bash
# Run on default device/platform
just flutter run

# Run on specific platform
just flutter run -d chrome      # Web
just flutter run -d macos       # macOS
just flutter run -d ios         # iOS simulator
just flutter run -d android     # Android emulator/device
```

### Building the Application
```bash
# Build for specific platforms
just flutter build apk          # Android APK
just flutter build ios          # iOS (requires macOS with Xcode)
just flutter build web          # Web
just flutter build macos        # macOS desktop
just flutter build windows      # Windows desktop
just flutter build linux        # Linux desktop
```

### Testing and Quality Checks
```bash
# Run all tests
just flutter test

# Run a specific test file
just flutter test test/widget_test.dart

# Analyze code for issues
just flutter analyze

# Format code
just dart format .

# Generate assets using flutter_gen
just flutter-gen
# or
just fg
```

### Dependency Management
```bash
# Get dependencies
just flutter pub get

# Upgrade dependencies
just flutter pub upgrade

# Check outdated packages
just flutter pub outdated

# Add new dependencies
just flutter pub add [dependency_name]           # Normal dependency
just flutter pub add dev:[dependency_name]       # Dev dependency

# Add multiple dependencies (mix of normal and dev)
just flutter pub add \
  dev:[dependency_1_name] \
  [dependency_2_name] \
  dev:[dependency_3_name]
```

## Project Architecture

This project follows a **Feature-Based Clean Architecture** approach that balances maintainability with development speed. It's a hybrid approach that combines Clean Architecture principles with pragmatic simplifications.

### Architecture Principles
- **Feature-First Organization**: Code is organized by features rather than layers
- **Clean Architecture Foundations**: Domain entities, repository pattern, and dependency injection
- **Pragmatic Simplification**: Reduced abstraction layers while maintaining testability
- **Functional Error Handling**: Using fpdart for robust error management

### Folder Structure
```
lib/
├── core/
│   ├── network/           # HTTP clients, interceptors
│   ├── providers/         # Global Riverpod providers
│   ├── config/           # Configuration management
│   └── utils/            # Shared utilities
├── features/
│   ├── auth/
│   │   ├── domain/       # Entities, failures, repository interfaces
│   │   ├── data/         # Repository implementations, data sources
│   │   └── presentation/ # UI components, screens, providers
│   ├── spotify/
│   │   ├── domain/       # Playlist, track entities
│   │   ├── data/         # Spotify API client, repositories
│   │   └── presentation/ # Playlist screens, widgets
│   └── analysis/
│       ├── domain/       # Classification entities, business logic
│       ├── data/         # LLM integration, data processing
│       └── presentation/ # Analysis screens, progress indicators
└── shared/
    └── widgets/          # Common UI components
```

### Key Architectural Decisions
- **Feature Boundaries**: Each feature is self-contained with its own domain, data, and presentation layers
- **Simplified Layers**: Combined application + infrastructure into `data/` layer to reduce boilerplate
- **Repository Pattern**: Maintained for testability and API abstraction
- **Dependency Injection**: Using Riverpod for clean dependency management
- **Error Handling**: Functional approach with fpdart's Either pattern throughout the stack

## Dependencies and Libraries

### Core Dependencies
- **flutter_hooks** (^0.21.2): React-style hooks for Flutter, enabling functional widget patterns
- **hooks_riverpod** (^2.6.1): State management solution combining Riverpod with Flutter Hooks
- **shadcn_ui** (^0.27.4): UI component library for consistent design
- **go_router** (^16.0.0): Declarative routing package for Flutter
- **logger** (^2.6.0): Structured logging for debugging and monitoring
- **dio** (^5.8.0+1): HTTP client for API requests and network operations
- **fpdart** (^1.1.1): Functional programming patterns for error handling
- **flutter_gen** (^5.10.0): Type-safe asset management with code generation

### Development Dependencies
- **flutter_lints** (^6.0.0): Official Flutter linting rules
- **lint** (^2.8.0): Additional linting rules for code quality
- **custom_lint** (^0.7.0): Custom linting rules framework
- **riverpod_lint** (^2.6.3): Riverpod-specific linting rules
- **mocktail** (^1.0.4): Mocking library for unit and widget tests
- **mocktail_image_network** (^1.2.0): Network image mocking for widget tests

## Code Standards

### State Management
- **Use Riverpod** for state management (without code generation)
- **Prefer HookConsumerWidget** over StatefulWidget whenever possible
- **Always check Riverpod documentation** using context7 MCP for up-to-date information

### Widget Design Principles
- **Small widgets should be pure**: Accept data through constructor arguments only
- **Avoid fetching state in small widgets**: State should be fetched at the screen/page level and passed down
- **Keep widgets focused**: Each widget should have a single responsibility
- **No _buildXXXX methods**: Create proper widgets instead of _buildXXXX helper methods

### Error Handling
- **No try-catch blocks outside data layer**: All external calls and error-prone operations should be wrapped in the feature's data layer
- **Use fpdart library** for functional error handling:
  - Return `Either<Failure, Success>` from data layer (repositories, API clients)
  - Define typed failures in domain layer for each feature
  - Propagate domain errors through the layers using fpdart
  - Handle errors gracefully at the presentation layer with proper user feedback
- **Feature-specific error handling**: Each feature defines its own failure types and error handling strategies

### Documentation and Dependencies
- **Always verify library documentation**: Use context7 MCP to check the latest documentation for any library before implementation
- **Check compatibility**: Ensure all dependencies are compatible with the current Flutter/Dart versions

### Code Quality
- The project uses `flutter_lints` package for code quality enforcement
- Additional linting provided by `lint` package for stricter code standards
- Custom linting rules via `custom_lint` and `riverpod_lint` for framework-specific checks
- Follow Flutter's recommended practices as configured in `analysis_options.yaml`
- Run `just flutter analyze` before committing changes

### Logging Strategy
- Use the `logger` package for structured logging throughout the application
- Configure log levels appropriately:
  - **verbose**: Detailed debug information
  - **debug**: General debugging information
  - **info**: Important application events
  - **warning**: Potentially harmful situations
  - **error**: Error events that might still allow the app to continue
  - **wtf**: Critical errors that should never happen
- Create a centralized logger instance in the infrastructure layer
- Include contextual information in log messages for easier debugging

### HTTP Client (Dio)
- Use `dio` as the primary HTTP client for all API requests
- Configure interceptors for:
  - Request/response logging
  - Authentication token injection
  - Error handling and retry logic
- Create a centralized Dio instance with proper configuration
- Handle network errors gracefully using fpdart's Either pattern

### Asset Management (flutter_gen)
- Use `flutter_gen` for type-safe asset management with code generation
- Configure flutter_gen in `pubspec.yaml` to generate asset classes
- Run `just flutter-gen` or `just fg` to generate asset classes after adding new assets
- Generated files are located in `lib/gen/` directory
- Access assets via generated classes: `Assets.config.configLocal`
- Generated files should be committed to version control for type-safe asset access
- Always regenerate assets when adding new files to the assets directory

### Testing Standards

#### General Testing Practices
- **Mocking with Mocktail**:
  - Prefer `mocktail` over `mockito` for all mocking needs
  - Create mock classes: `class MockRepository extends Mock implements Repository {}`
  - Register fallback values for custom types in `setUpAll()`
- **Clean Architecture Testing**: Test components in isolation using dependency injection
- **Test Organization**: Group related tests using `group()` for better structure

#### Widget Testing
- **Core Framework**:
  - Use `flutter_test` package with `testWidgets()` function
  - Leverage `WidgetTester` for building and interacting with widgets
  - Use `pumpWidget()` to render widgets and `pump()`/`pumpAndSettle()` for animations

- **Widget Test Structure**:
  ```dart
  testWidgets('widget should display correct UI', (tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(home: MyWidget())
    );
    
    // Act & Assert
    expect(find.text('Hello'), findsOneWidget);
  });
  ```

- **Widget Testing Patterns**:
  - **Finders**: Use `find.byType()`, `find.byKey()`, `find.text()`, `find.byWidget()`
  - **Matchers**: `findsOneWidget`, `findsNothing`, `findsWidgets`, `findsNWidgets`
  - **Interactions**: `tester.tap()`, `tester.drag()`, `tester.enterText()`
  - **Network Image Mocking**: Use `mockNetworkImages()` from `mocktail_image_network`
  - **Platform-Specific Testing**: Test different screen sizes and device configurations

#### Integration Testing
- Use `IntegrationTestWidgetsFlutterBinding` for integration tests
- Place integration tests in `integration_test/` directory
- Test user flows, scrolling performance, and complex interactions

## Key Configuration Files

- **pubspec.yaml**: Main project configuration, dependencies, and Flutter-specific settings
- **analysis_options.yaml**: Dart analyzer and linting configuration
- **.fvmrc**: Flutter Version Management configuration (Flutter 3.32.5)

## Future Development Notes

This project is intended to be a Spotify auto playlist application but currently only contains the Flutter template code. When implementing Spotify functionality, consider:
- Adding Spotify Web API SDK dependencies
- Implementing OAuth authentication flow
- Creating playlist management features
- Handling platform-specific requirements for OAuth callbacks

## Workflow Memories

- Use `just tocs` after updating a .md file
- Use shadcn_ui instead of material widgets
- When you want to run a flutter command, always add `just` before the command (example: `just flutter pub get` instead of `flutter pub get`)
- When you are about to do a big task, use sequential-thinking mcp
- **Always update TODO.md when a task is completed** - mark items as done with [x] and keep the file current
- Automatically created playlist names should follow the format: `auto[criteria]` or `auto[criteria1 | criteria2]` for multiple criteria
- **Remote documentation cache**: Important external docs are cached in `/remote-doc-knowledge-fetched-by-claude/` directory for future reference
- Use flutter_gen for managing assets (https://pub.dev/packages/flutter_gen) - context7 mcp for up to date documentation
- When setting the style of a Text widget, always use Shadcn inherited theme. You can modifying it if you want but use the copyWith method on it.
- **Never modify a .freezed.dart file directly**
- **Never modify a .g.dart file directly**
