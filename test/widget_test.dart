// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:spotify_auto_playlist/core/config/config_loader.dart';
import 'package:spotify_auto_playlist/core/providers/core_providers.dart';
import 'package:spotify_auto_playlist/main.dart';

void main() {
  testWidgets('App loads with config', (WidgetTester tester) async {
    final config = AppConfig(
      app: const AppInfo(
        name: 'Test App',
        version: '1.0.0',
        environment: 'test',
      ),
      spotify: const SpotifyConfig(
        clientId: 'test_client_id',
        redirectUri: 'http://localhost:8080/callback',
        scopes: ['playlist-read-private'],
      ),
      api: const ApiConfig(
        baseUrl: 'https://api.spotify.com/v1',
        tokenUrl: 'https://accounts.spotify.com/api/token',
        authorizeUrl: 'https://accounts.spotify.com/authorize',
      ),
      features: const FeaturesConfig(
        enableLogging: true,
        maxPlaylistAnalysis: 10,
        defaultPlaylistPrefix: 'auto',
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          configProvider.overrideWithValue(config),
        ],
        child: const SpotifyAutoPlaylistApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Welcome to Spotify Auto Playlist'), findsOneWidget);
    expect(find.byIcon(LucideIcons.music), findsOneWidget);
  });
}
