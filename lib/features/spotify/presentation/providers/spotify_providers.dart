import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/clients/spotify_api_client.dart';
import '../../data/repositories/spotify_repository_impl.dart';
import '../../domain/repositories/spotify_repository.dart';
import '../../domain/entities/spotify_playlist.dart';

final spotifyApiClientProvider = Provider<SpotifyApiClient>((ref) {
  final dio = ref.watch(spotifyDioProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final logger = ref.watch(loggerProvider);
  
  return SpotifyApiClient(
    dio: dio,
    authRepository: authRepository,
    logger: logger,
  );
});

final spotifyRepositoryProvider = Provider<SpotifyRepository>((ref) {
  final apiClient = ref.watch(spotifyApiClientProvider);
  final logger = ref.watch(loggerProvider);
  
  return SpotifyRepositoryImpl(
    apiClient: apiClient,
    logger: logger,
  );
});

final userPlaylistsProvider = FutureProvider<List<SpotifyPlaylist>>((ref) async {
  final repository = ref.watch(spotifyRepositoryProvider);
  final result = await repository.getUserPlaylists();
  return result.fold(
    (failure) => throw failure,
    (playlists) => playlists,
  );
});