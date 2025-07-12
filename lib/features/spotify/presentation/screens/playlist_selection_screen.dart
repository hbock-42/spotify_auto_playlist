import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../domain/entities/spotify_playlist.dart';
import '../providers/spotify_providers.dart';

class PlaylistSelectionScreen extends HookConsumerWidget {
  const PlaylistSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistsAsync = ref.watch(userPlaylistsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Playlist'),
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => context.go('/dashboard'),
        ),
      ),
      body: SafeArea(
        child: playlistsAsync.when(
          data: (playlists) => PlaylistListView(playlists: playlists),
          loading: () => const PlaylistLoadingState(),
          error: (error, stack) => PlaylistErrorState(error: error),
        ),
      ),
    );
  }
}

class PlaylistLoadingState extends StatelessWidget {
  const PlaylistLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(),
          ),
          const SizedBox(height: 24),
          Text(
            'Loading your playlists...',
            style: theme.textTheme.p.copyWith(
              color: theme.colorScheme.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}

class PlaylistErrorState extends StatelessWidget {
  const PlaylistErrorState({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.triangleAlert,
                size: 64,
                color: theme.colorScheme.destructive,
              ),
              const SizedBox(height: 24),
              Text(
                'Error Loading Playlists',
                style: theme.textTheme.h3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                error.toString(),
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ShadButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Back to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistListView extends StatelessWidget {
  const PlaylistListView({super.key, required this.playlists});

  final List<SpotifyPlaylist> playlists;

  @override
  Widget build(BuildContext context) {
    if (playlists.isEmpty) {
      return const EmptyPlaylistState();
    }

    final theme = ShadTheme.of(context);
    
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a playlist to analyze',
              style: theme.textTheme.h2,
            ),
            const SizedBox(height: 8),
            Text(
              'Select one of your playlists to create auto-generated playlists based on song characteristics.',
              style: theme.textTheme.p.copyWith(
                color: theme.colorScheme.mutedForeground,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: playlists.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final playlist = playlists[index];
                  return PlaylistCard(
                    playlist: playlist,
                    onTap: () => context.go('/analyze?playlistId=${playlist.id}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyPlaylistState extends StatelessWidget {
  const EmptyPlaylistState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.music,
                size: 64,
                color: theme.colorScheme.mutedForeground,
              ),
              const SizedBox(height: 24),
              Text(
                'No Playlists Found',
                style: theme.textTheme.h3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Create some playlists in Spotify and come back!',
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ShadButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Back to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playlist,
    required this.onTap,
  });

  final SpotifyPlaylist playlist;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return ShadCard(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              PlaylistImage(playlist: playlist),
              const SizedBox(width: 16),
              Expanded(
                child: PlaylistInfo(playlist: playlist),
              ),
              Icon(
                LucideIcons.chevronRight,
                color: theme.colorScheme.mutedForeground,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistImage extends StatelessWidget {
  const PlaylistImage({super.key, required this.playlist});

  final SpotifyPlaylist playlist;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.muted,
      ),
      child: playlist.imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                playlist.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    PlaylistFallbackIcon(theme: theme),
              ),
            )
          : PlaylistFallbackIcon(theme: theme),
    );
  }
}

class PlaylistFallbackIcon extends StatelessWidget {
  const PlaylistFallbackIcon({super.key, required this.theme});

  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Icon(
      LucideIcons.music,
      color: theme.colorScheme.mutedForeground,
      size: 24,
    );
  }
}

class PlaylistInfo extends StatelessWidget {
  const PlaylistInfo({super.key, required this.playlist});

  final SpotifyPlaylist playlist;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          playlist.name,
          style: theme.textTheme.h4,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        if (playlist.description != null && playlist.description!.isNotEmpty) ...[
          Text(
            playlist.description!,
            style: theme.textTheme.small.copyWith(
              color: theme.colorScheme.mutedForeground,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
        ],
        Text(
          playlist.totalTracks != null ? '${playlist.totalTracks} tracks' : 'Track count unknown',
          style: theme.textTheme.small.copyWith(
            color: theme.colorScheme.mutedForeground,
          ),
        ),
      ],
    );
  }
}