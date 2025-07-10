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
      * [Layer Structure](#layer-structure)
      * [Folder Structure](#folder-structure)
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
```

### Dependency Management
```bash
# Get dependencies
just flutter pub get

# Upgrade dependencies
just flutter pub upgrade

# Check outdated packages
just flutter pub outdated
```

## Project Architecture

This project follows **Clean Architecture** principles with clear separation of concerns across layers:

### Layer Structure
- **Domain Layer**: Business logic, entities, and use cases
- **Application Layer**: State management, providers, and application services
- **Infrastructure Layer**: External services, APIs, data sources
- **Presentation Layer**: UI components, screens, and widgets

### Folder Structure
- **lib/**
  - **domain/**: Core business logic
    - **entities/**: Business entities
    - **repositories/**: Repository interfaces
    - **use_cases/**: Business use cases
    - **failures/**: Domain-specific failures
  - **application/**: State management and providers
    - **providers/**: Riverpod providers
    - **notifiers/**: State notifiers
  - **infrastructure/**: External integrations
    - **repositories/**: Repository implementations
    - **data_sources/**: Remote and local data sources
    - **services/**: External service integrations
  - **presentation/**: UI layer
    - **screens/**: Full screen widgets
    - **widgets/**: Reusable UI components
    - **router/**: Navigation configuration

## Dependencies and Libraries

### Core Dependencies
- **flutter_hooks** (^0.21.2): React-style hooks for Flutter, enabling functional widget patterns
- **hooks_riverpod** (^2.6.1): State management solution combining Riverpod with Flutter Hooks
- **shadcn_ui** (^0.27.4): UI component library for consistent design
- **logger** (^2.6.0): Structured logging for debugging and monitoring
- **dio** (^5.8.0+1): HTTP client for API requests and network operations
- **fpdart** (^1.1.1): Functional programming patterns for error handling

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

### Error Handling
- **No try-catch blocks outside infrastructure layer**: All external calls and error-prone operations should be wrapped in the infrastructure layer
- **Use fpdart library** for functional error handling:
  - Return `Either<Failure, Success>` from infrastructure layer
  - Propagate domain errors through the layers using fpdart
  - Handle errors gracefully at the presentation layer

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
