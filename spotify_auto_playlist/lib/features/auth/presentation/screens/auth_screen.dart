import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../providers/auth_providers.dart';
import '../states/auth_state.dart';
import '../notifiers/auth_notifier.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final theme = ShadTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Spotify'),
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
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
                    'Connect Your Spotify Account',
                    style: theme.textTheme.h2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'We need access to your Spotify account to analyze your playlists and create new ones.',
                    style: theme.textTheme.p.copyWith(
                      color: theme.colorScheme.mutedForeground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  AuthButton(authState: authState, authNotifier: authNotifier),
                  const SizedBox(height: 24),
                  Text(
                    'Your data is secure and we only access what you authorize.',
                    style: theme.textTheme.small.copyWith(
                      color: theme.colorScheme.mutedForeground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.authState,
    required this.authNotifier,
  });

  final AuthState authState;
  final AuthNotifier authNotifier;

  @override
  Widget build(BuildContext context) {
    return authState.map(
      initial: (_) => ConnectButton(authNotifier: authNotifier),
      loading: (_) => const LoadingButton(),
      authenticated: (authenticated) => AuthenticatedButton(authNotifier: authNotifier),
      unauthenticated: (_) => ConnectButton(authNotifier: authNotifier),
      error: (error) => Column(
        children: [
          ConnectButton(authNotifier: authNotifier),
          const SizedBox(height: 16),
          ErrorMessage(error: error.failure.toString()),
        ],
      ),
    );
  }
}

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key, required this.authNotifier});

  final AuthNotifier authNotifier;

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: () => authNotifier.signIn(),
      size: ShadButtonSize.lg,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.music),
          SizedBox(width: 12),
          Text('Connect with Spotify'),
        ],
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: null,
      size: ShadButtonSize.lg,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 12),
          Text('Connecting...'),
        ],
      ),
    );
  }
}

class AuthenticatedButton extends StatelessWidget {
  const AuthenticatedButton({super.key, required this.authNotifier});

  final AuthNotifier authNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadButton(
          onPressed: () => context.go('/dashboard'),
          size: ShadButtonSize.lg,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.check),
              SizedBox(width: 12),
              Text('Continue to Dashboard'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ShadButton.outline(
          onPressed: () => authNotifier.signOut(),
          child: const Text('Disconnect'),
        ),
      ],
    );
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.destructive.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.destructive.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            LucideIcons.triangleAlert,
            color: theme.colorScheme.destructive,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              error,
              style: theme.textTheme.small.copyWith(
                color: theme.colorScheme.destructive,
              ),
            ),
          ),
        ],
      ),
    );
  }
}