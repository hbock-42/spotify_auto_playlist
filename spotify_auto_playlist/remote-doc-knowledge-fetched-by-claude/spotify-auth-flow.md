# Spotify Authentication Flow

## Recommended Flow
- Authorization Code with PKCE for Flutter applications
- Suitable for long-running applications with secure client secret storage

## Dashboard Setup Steps
1. Go to Spotify Developer Dashboard
2. Click "Create an App"
3. Enter App Name and Description
4. Accept Developer Terms of Service
5. Configure redirect URIs (not scopes)
6. Save settings

## Authorization Process
- Client credentials flow: Limited to public data only
- Authorization code flow: Access user-specific data (required for playlists)
- Scopes determine access permissions requested from user