import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class WelcomeScreen extends HookConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const WelcomeHeader(),
                  const SizedBox(height: 48),
                  const WelcomeActionButtons(),
                  const SizedBox(height: 48),
                  const WelcomeFeatureHighlights(),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        Icon(
          LucideIcons.music2,
          size: 80,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: 24),
        Text(
          'Spotify Auto Playlist',
          style: theme.textTheme.h1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Transform your playlists with AI-powered organization',
          style: theme.textTheme.p.copyWith(
            color: theme.colorScheme.mutedForeground,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class WelcomeActionButtons extends StatelessWidget {
  const WelcomeActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadButton(
          onPressed: () => context.go('/demo'),
          size: ShadButtonSize.lg,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.play),
              SizedBox(width: 8),
              Text('Try Demo'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ShadButton.outline(
          onPressed: () => context.go('/auth'),
          size: ShadButtonSize.lg,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.logIn),
              SizedBox(width: 8),
              Text('Connect Spotify'),
            ],
          ),
        ),
      ],
    );
  }
}

class WelcomeFeatureHighlights extends StatelessWidget {
  const WelcomeFeatureHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final features = [
      (LucideIcons.trendingUp, 'AI Analysis', 'Understand your music taste'),
      (LucideIcons.sparkles, 'Smart Grouping', 'Organize by mood, genre, and more'),
      (LucideIcons.listMusic, 'Auto Creation', 'Generate playlists instantly'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: features.map((feature) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Icon(
                  feature.$1,
                  size: 32,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 8),
                Text(
                  feature.$2,
                  style: theme.textTheme.small.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  feature.$3,
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
