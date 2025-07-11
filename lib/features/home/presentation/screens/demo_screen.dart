import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DemoScreen extends HookConsumerWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = useState(0);
    final isAnalyzing = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
        actions: [
          ShadButton.outline(
            onPressed: () => context.go('/auth'),
            size: ShadButtonSize.sm,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.logIn, size: 16),
                SizedBox(width: 4),
                Text('Connect Spotify'),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  _buildProgressIndicator(context, currentStep.value),
                  const SizedBox(height: 32),
                  Expanded(
                    child: _buildStepContent(
                      context,
                      currentStep.value,
                      isAnalyzing.value,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildNavigationButtons(
                    context,
                    currentStep,
                    isAnalyzing,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(BuildContext context, int currentStep) {
    final theme = ShadTheme.of(context);
    final steps = ['Select Playlist', 'AI Analysis', 'Review Results'];

    return Row(
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final isActive = index <= currentStep;
        final isCompleted = index < currentStep;

        return Expanded(
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? theme.colorScheme.primary
                      : theme.colorScheme.muted,
                ),
                child: Center(
                  child: isCompleted
                      ? Icon(
                          LucideIcons.check,
                          size: 16,
                          color: theme.colorScheme.primaryForeground,
                        )
                      : Text(
                          '${index + 1}',
                          style: theme.textTheme.small.copyWith(
                            color: isActive
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.mutedForeground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              if (index < steps.length - 1)
                Expanded(
                  child: Container(
                    height: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: isCompleted
                        ? theme.colorScheme.primary
                        : theme.colorScheme.muted,
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStepContent(BuildContext context, int step, bool isAnalyzing) {
    switch (step) {
      case 0:
        return _buildPlaylistSelection(context);
      case 1:
        return _buildAnalysisStep(context, isAnalyzing);
      case 2:
        return _buildResults(context);
      default:
        return const SizedBox();
    }
  }

  Widget _buildPlaylistSelection(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select a playlist to analyze',
          style: theme.textTheme.h3,
        ),
        const SizedBox(height: 24),
        _buildDemoPlaylistCard(
          context,
          'Summer Vibes 2024',
          '142 songs • 8h 24m',
          'A mix of everything I loved this summer',
          true,
        ),
        const SizedBox(height: 16),
        _buildDemoPlaylistCard(
          context,
          'Workout Mix',
          '87 songs • 5h 12m',
          'High energy tracks for the gym',
          false,
        ),
        const SizedBox(height: 16),
        _buildDemoPlaylistCard(
          context,
          'Chill Evening',
          '64 songs • 3h 45m',
          'Relaxing tunes for winding down',
          false,
        ),
      ],
    );
  }

  Widget _buildDemoPlaylistCard(
    BuildContext context,
    String title,
    String subtitle,
    String description,
    bool isSelected,
  ) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      border: isSelected
          ? Border.all(color: theme.colorScheme.primary, width: 2)
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: theme.colorScheme.muted,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                LucideIcons.music,
                color: theme.colorScheme.mutedForeground,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.large.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.small.copyWith(
                      color: theme.colorScheme.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: theme.textTheme.small.copyWith(
                      color: theme.colorScheme.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                LucideIcons.check,
                color: theme.colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalysisStep(BuildContext context, bool isAnalyzing) {
    final theme = ShadTheme.of(context);
    final progress = useState(0.0);

    useEffect(() {
      if (isAnalyzing) {
        final timer = Stream.periodic(
          const Duration(milliseconds: 50),
          (i) => (i + 1) * 0.01,
        ).take(100).listen((value) {
          progress.value = value.clamp(0.0, 1.0);
        });

        return timer.cancel;
      }
      return null;
    }, [isAnalyzing]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Analyzing your playlist with AI',
          style: theme.textTheme.h3,
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: 300,
          child: Column(
            children: [
              ShadProgress(
                value: isAnalyzing ? progress.value : 1.0,
              ),
              const SizedBox(height: 16),
              Text(
                isAnalyzing
                    ? 'Analyzing song ${(progress.value * 142).toInt()} of 142'
                    : 'Analysis complete!',
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        if (!isAnalyzing)
          Icon(
            LucideIcons.check,
            size: 64,
            color: theme.colorScheme.primary,
          ),
      ],
    );
  }

  Widget _buildResults(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggested playlists',
          style: theme.textTheme.h3,
        ),
        const SizedBox(height: 8),
        Text(
          'Based on AI analysis of "Summer Vibes 2024"',
          style: theme.textTheme.p.copyWith(
            color: theme.colorScheme.mutedForeground,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView(
            children: [
              _buildSuggestedPlaylist(
                context,
                'auto[party]',
                42,
                ['Upbeat tempo', 'Dance-friendly', 'High energy'],
                true,
              ),
              const SizedBox(height: 16),
              _buildSuggestedPlaylist(
                context,
                'auto[chill | acoustic]',
                28,
                ['Relaxed vibe', 'Acoustic instruments', 'Mellow'],
                true,
              ),
              const SizedBox(height: 16),
              _buildSuggestedPlaylist(
                context,
                'auto[indie | alternative]',
                35,
                ['Indie rock', 'Alternative sound', 'Unique style'],
                false,
              ),
              const SizedBox(height: 16),
              _buildSuggestedPlaylist(
                context,
                'auto[electronic]',
                20,
                ['Electronic beats', 'Synthesizers', 'Modern production'],
                false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestedPlaylist(
    BuildContext context,
    String name,
    int songCount,
    List<String> tags,
    bool isSelected,
  ) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      border: isSelected
          ? Border.all(color: theme.colorScheme.primary, width: 2)
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: theme.textTheme.large.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  '$songCount songs',
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
                if (isSelected) ...[
                  const SizedBox(width: 8),
                  Icon(
                    LucideIcons.check,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) {
                return ShadBadge(
                  child: Text(tag),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(
    BuildContext context,
    ValueNotifier<int> currentStep,
    ValueNotifier<bool> isAnalyzing,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (currentStep.value > 0)
          ShadButton.outline(
            onPressed: () {
              if (currentStep.value > 0) {
                currentStep.value--;
                isAnalyzing.value = false;
              }
            },
            child: const Text('Back'),
          )
        else
          const SizedBox(width: 100),
        if (currentStep.value < 2)
          ShadButton(
            onPressed: () async {
              if (currentStep.value == 0) {
                currentStep.value++;
              } else if (currentStep.value == 1 && !isAnalyzing.value) {
                isAnalyzing.value = true;
                await Future.delayed(const Duration(seconds: 5));
                currentStep.value++;
                isAnalyzing.value = false;
              }
            },
            child: Text(currentStep.value == 1 && !isAnalyzing.value
                ? 'View Results'
                : 'Next'),
          )
        else
          ShadButton(
            onPressed: () => context.go('/auth'),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.logIn, size: 16),
                SizedBox(width: 8),
                Text('Connect Spotify to Create'),
              ],
            ),
          ),
      ],
    );
  }
}