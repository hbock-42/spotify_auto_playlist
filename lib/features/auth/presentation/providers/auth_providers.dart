import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_auto_playlist/features/auth/data/spotify_oauth2_client.dart';

import '../../../../core/providers/core_providers.dart';
import '../../data/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/use_cases/authenticate_user.dart';
import '../notifiers/auth_notifier.dart';
import '../states/auth_state.dart';

// Repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final config = ref.watch(configProvider);
  return AuthRepositoryImpl(
    secureStorage: ref.watch(secureStorageProvider),
    logger: ref.watch(loggerProvider),
    config: config,
    spotifyClient: SpotifyOAuth2Client(
      authorizeUrl: config.api.authorizeUrl,
      tokenUrl: config.api.tokenUrl,
      config: config,
    ),
  );
});

// Use case providers
final authenticateUserProvider = Provider<AuthenticateUser>((ref) {
  return AuthenticateUser(ref.watch(authRepositoryProvider));
});

// State notifier provider
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    authenticateUser: ref.watch(authenticateUserProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
});
