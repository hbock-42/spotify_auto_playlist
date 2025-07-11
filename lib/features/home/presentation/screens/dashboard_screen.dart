import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:spotify_auto_playlist/features/auth/presentation/states/auth_state.dart';

import '../../../auth/presentation/providers/auth_providers.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final theme = ShadTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.logOut),
            onPressed: () => authNotifier.signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.music2,
                    size: 80,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Welcome to Your Dashboard!',
                    style: theme.textTheme.h1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your Spotify account is connected successfully. You can now analyze your playlists and create new ones.',
                    style: theme.textTheme.p.copyWith(
                      color: theme.colorScheme.mutedForeground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  authState.map(
                    authenticated: (tokens) => Column(
                      children: [
                        ShadButton(
                          onPressed: () {
                            // TODO: Implement playlist analysis
                            _showComingSoonDialog(context, 'Playlist Analysis');
                          },
                          size: ShadButtonSize.lg,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(LucideIcons.trendingUp),
                              SizedBox(width: 12),
                              Text('Analyze Playlists'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ShadButton.outline(
                          onPressed: () {
                            // TODO: Implement playlist creation
                            _showComingSoonDialog(context, 'Auto Playlist Creation');
                          },
                          size: ShadButtonSize.lg,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(LucideIcons.plus),
                              SizedBox(width: 12),
                              Text('Create Auto Playlist'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    initial: (_) => const SizedBox(),
                    loading: (_) => const SizedBox(),
                    unauthenticated: (_) => const SizedBox(),
                    error: (_) => const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Coming Soon'),
        description: Text(
          '$feature is not yet implemented. Stay tuned for updates!',
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
