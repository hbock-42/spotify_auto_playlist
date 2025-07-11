import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/config/config_loader.dart';
import 'core/providers/core_providers.dart';
import 'gen/assets.gen.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final configResult = await ConfigLoader.loadConfig(
    configFile: Assets.config.configLocal,
  );

  configResult.fold(
    (error) {
      logger.e('Failed to load config: $error');
      runApp(
        const ProviderScope(
          child: ErrorApp(),
        ),
      );
    },
    (config) {
      logger.i('Config loaded successfully: ${config.app.name} v${config.app.version}');
      runApp(
        ProviderScope(
          overrides: [
            configProvider.overrideWithValue(config),
          ],
          child: const SpotifyAutoPlaylistApp(),
        ),
      );
    },
  );
}

class SpotifyAutoPlaylistApp extends ConsumerWidget {
  const SpotifyAutoPlaylistApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider);
    return ShadApp.custom(
      themeMode: ThemeMode.system,
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadGreenColorScheme.light(),
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadGreenColorScheme.dark(),
      ),
      appBuilder: (context) {
        return MaterialApp(
          title: config.app.name,
          theme: Theme.of(context),
          home: const HomePage(),
          builder: (context, child) {
            return ShadAppBuilder(child: child!);
          },
        );
      },
    );
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      themeMode: ThemeMode.system,
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadRedColorScheme.light(),
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadRedColorScheme.dark(),
      ),
      appBuilder: (context) {
        return MaterialApp(
          title: 'Configuration Error',
          theme: Theme.of(context),
          home: const ErrorPage(),
          builder: (context, child) {
            return ShadAppBuilder(child: child!);
          },
        );
      },
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configuration Error',
          style: theme.textTheme.h4.copyWith(
            color: theme.colorScheme.destructiveForeground,
          ),
        ),
        backgroundColor: theme.colorScheme.destructive,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.triangleAlert,
              size: 64,
              color: theme.colorScheme.destructive,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load configuration',
              style: theme.textTheme.h2,
            ),
            const SizedBox(height: 8),
            Text(
              'Please check the configuration file',
              style: theme.textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spotify Auto Playlist',
          style: theme.textTheme.h4.copyWith(
            color: theme.colorScheme.primaryForeground,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.primaryForeground,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.music,
              size: 64,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome to Spotify Auto Playlist',
              style: theme.textTheme.h2,
            ),
            const SizedBox(height: 8),
            Text(
              'Create automatic playlists based on your preferences',
              style: theme.textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}
