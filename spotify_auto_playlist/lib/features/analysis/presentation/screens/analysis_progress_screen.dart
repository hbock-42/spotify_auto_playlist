import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../domain/entities/batch_analysis_progress.dart';
import '../providers/analysis_providers.dart';

class AnalysisProgressScreen extends HookConsumerWidget {
  const AnalysisProgressScreen({super.key, required this.playlistId});

  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysisState = ref.watch(batchAnalysisProvider(playlistId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analyzing Playlist'),
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => context.go('/select-playlist'),
        ),
      ),
      body: SafeArea(
        child: analysisState.when(
          idle: () => AnalysisIdleState(playlistId: playlistId),
          running: (progress) => AnalysisRunningState(progress: progress, playlistId: playlistId),
          paused: (progress) => AnalysisPausedState(
            progress: progress,
            playlistId: playlistId,
          ),
          completed: (progress) => AnalysisCompletedState(progress: progress),
          error: (message, progress) => AnalysisErrorState(
            message: message,
            progress: progress,
            playlistId: playlistId,
          ),
        ),
      ),
    );
  }
}

class AnalysisIdleState extends StatelessWidget {
  const AnalysisIdleState({super.key, required this.playlistId});

  final String playlistId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.play,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Ready to Analyze',
                style: theme.textTheme.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'We\'re ready to analyze your playlist. This process will examine each song and categorize it by mood, context, and style.',
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              StartAnalysisButton(playlistId: playlistId),
            ],
          ),
        ),
      ),
    );
  }
}

class StartAnalysisButton extends HookConsumerWidget {
  const StartAnalysisButton({super.key, required this.playlistId});

  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadButton(
      onPressed: () {
        ref.read(batchAnalysisProvider(playlistId).notifier).startAnalysis();
      },
      size: ShadButtonSize.lg,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.play),
          SizedBox(width: 12),
          Text('Start Analysis'),
        ],
      ),
    );
  }
}

class AnalysisRunningState extends StatelessWidget {
  const AnalysisRunningState({super.key, required this.progress, required this.playlistId});

  final BatchAnalysisProgress progress;
  final String playlistId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final progressPercentage = progress.totalSongs > 0 
        ? progress.completedSongs / progress.totalSongs 
        : 0.0;
    
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        value: progressPercentage,
                        strokeWidth: 8,
                        backgroundColor: theme.colorScheme.muted,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${(progressPercentage * 100).toInt()}%',
                        style: theme.textTheme.h3.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Analyzing Songs',
                style: theme.textTheme.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              if (progress.currentSongTitle != null) ...[
                Text(
                  'Currently analyzing:',
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  progress.currentSongTitle!,
                  style: theme.textTheme.p,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 24),
              ],
              AnalysisProgressStats(progress: progress),
              const SizedBox(height: 32),
              AnalysisControlButtons(progress: progress, playlistId: playlistId),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalysisProgressStats extends StatelessWidget {
  const AnalysisProgressStats({super.key, required this.progress});

  final BatchAnalysisProgress progress;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProgressStat(
          icon: LucideIcons.check,
          label: 'Completed',
          value: progress.completedSongs.toString(),
          color: theme.colorScheme.primary,
        ),
        ProgressStat(
          icon: LucideIcons.clock,
          label: 'Remaining',
          value: (progress.totalSongs - progress.completedSongs).toString(),
          color: theme.colorScheme.mutedForeground,
        ),
        if (progress.failedSongs > 0)
          ProgressStat(
            icon: LucideIcons.x,
            label: 'Failed',
            value: progress.failedSongs.toString(),
            color: theme.colorScheme.destructive,
          ),
      ],
    );
  }
}

class ProgressStat extends StatelessWidget {
  const ProgressStat({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.h4.copyWith(color: color),
        ),
        Text(
          label,
          style: theme.textTheme.small.copyWith(
            color: theme.colorScheme.mutedForeground,
          ),
        ),
      ],
    );
  }
}

class AnalysisControlButtons extends HookConsumerWidget {
  const AnalysisControlButtons({super.key, required this.progress, required this.playlistId});

  final BatchAnalysisProgress progress;
  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShadButton.outline(
          onPressed: () {
            ref.read(batchAnalysisProvider(playlistId).notifier).pauseAnalysis();
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.pause),
              SizedBox(width: 8),
              Text('Pause'),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ShadButton.outline(
          onPressed: () {
            ref.read(batchAnalysisProvider(playlistId).notifier).cancelAnalysis();
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.x),
              SizedBox(width: 8),
              Text('Cancel'),
            ],
          ),
        ),
      ],
    );
  }
}

class AnalysisPausedState extends StatelessWidget {
  const AnalysisPausedState({
    super.key,
    required this.progress,
    required this.playlistId,
  });

  final BatchAnalysisProgress progress;
  final String playlistId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final progressPercentage = progress.totalSongs > 0 
        ? progress.completedSongs / progress.totalSongs 
        : 0.0;
    
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.pause,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Analysis Paused',
                style: theme.textTheme.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                '${(progressPercentage * 100).toInt()}% completed (${progress.completedSongs}/${progress.totalSongs} songs)',
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ResumeAnalysisButton(playlistId: playlistId),
            ],
          ),
        ),
      ),
    );
  }
}

class ResumeAnalysisButton extends HookConsumerWidget {
  const ResumeAnalysisButton({super.key, required this.playlistId});

  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadButton(
      onPressed: () {
        ref.read(batchAnalysisProvider(playlistId).notifier).resumeAnalysis();
      },
      size: ShadButtonSize.lg,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.play),
          SizedBox(width: 12),
          Text('Resume Analysis'),
        ],
      ),
    );
  }
}

class AnalysisCompletedState extends StatelessWidget {
  const AnalysisCompletedState({super.key, required this.progress});

  final BatchAnalysisProgress progress;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.check,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Analysis Complete!',
                style: theme.textTheme.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Successfully analyzed ${progress.completedSongs} songs. Ready to generate playlist proposals.',
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
              if (progress.failedSongs > 0) ...[
                const SizedBox(height: 16),
                Text(
                  '${progress.failedSongs} songs failed to analyze and will be excluded.',
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.destructive,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 48),
              ShadButton(
                onPressed: () => context.go('/proposals'),
                size: ShadButtonSize.lg,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(LucideIcons.arrowRight),
                    SizedBox(width: 12),
                    Text('View Proposals'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalysisErrorState extends StatelessWidget {
  const AnalysisErrorState({
    super.key,
    required this.message,
    required this.progress,
    required this.playlistId,
  });

  final String message;
  final BatchAnalysisProgress? progress;
  final String playlistId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.triangleAlert,
                size: 80,
                color: theme.colorScheme.destructive,
              ),
              const SizedBox(height: 32),
              Text(
                'Analysis Error',
                style: theme.textTheme.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
              if (progress != null) ...[
                const SizedBox(height: 24),
                Text(
                  'Progress: ${progress!.completedSongs}/${progress!.totalSongs} songs completed',
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 48),
              RetryAnalysisButton(playlistId: playlistId),
            ],
          ),
        ),
      ),
    );
  }
}

class RetryAnalysisButton extends HookConsumerWidget {
  const RetryAnalysisButton({super.key, required this.playlistId});

  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadButton(
      onPressed: () {
        ref.read(batchAnalysisProvider(playlistId).notifier).startAnalysis();
      },
      size: ShadButtonSize.lg,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.rotateCcw),
          SizedBox(width: 12),
          Text('Retry Analysis'),
        ],
      ),
    );
  }
}