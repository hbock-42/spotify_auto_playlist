import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PlaylistProposalsScreen extends HookConsumerWidget {
  const PlaylistProposalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist Proposals'),
      ),
      body: Center(
        child: Text(
          'Playlist Proposals Screen - Coming Soon',
          style: theme.textTheme.h3,
        ),
      ),
    );
  }
}