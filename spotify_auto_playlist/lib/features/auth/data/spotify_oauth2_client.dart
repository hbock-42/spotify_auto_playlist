import 'package:flutter/foundation.dart';
import 'package:oauth2_client/oauth2_client.dart';

import '../../../core/config/config_loader.dart';

class SpotifyOAuth2Client extends OAuth2Client {
  SpotifyOAuth2Client({
    required super.authorizeUrl,
    required super.tokenUrl,
    required AppConfig config,
  }) : super(
         redirectUri: SpotifyOAuth2Client._redirectUri(config),
         customUriScheme: _getCustomUriScheme(SpotifyOAuth2Client._redirectUri(config)),
       );

  static String _redirectUri(AppConfig config) => kIsWeb && config.spotify.redirectUriWeb != null
      ? config.spotify.redirectUriWeb!
      : config.spotify.redirectUri;

  static String _getCustomUriScheme(String redirectUri) {
    final uri = Uri.parse(redirectUri);
    if (uri.scheme == 'http' || uri.scheme == 'https') {
      // For web platforms, return the full URI
      return redirectUri;
    }
    // For mobile platforms, return just the scheme
    return uri.scheme;
  }
}
