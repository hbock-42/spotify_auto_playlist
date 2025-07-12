# Spotify OAuth Scopes

## Required Scopes for Playlist Operations

- `playlist-read-private` - Read access to user's private playlists
- `playlist-read-collaborative` - Include collaborative playlists when requesting user's playlists  
- `playlist-modify-public` - Write access to user's public playlists
- `playlist-modify-private` - Write access to user's private playlists

## Key Points

- Scopes are NOT configured in Spotify Developer Dashboard
- Scopes are specified in application code during authorization request
- Use Authorization Code with PKCE flow for Flutter apps
- Dashboard only needs redirect URIs configured
- Scopes determine what permissions user is asked to grant