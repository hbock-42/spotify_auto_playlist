-- Tracks table for storing track metadata
CREATE TABLE IF NOT EXISTS public.tracks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  spotify_id VARCHAR(255) UNIQUE,
  itunes_id VARCHAR(255) UNIQUE,
  title VARCHAR(500) NOT NULL,
  artist VARCHAR(500) NOT NULL,
  duration_ms INTEGER,
  preview_url TEXT,
  artwork_url TEXT,
  genre VARCHAR(100),
  release_date VARCHAR(50),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  itunes_track_id UUID REFERENCES public.itunes_tracks(id)
);

-- Indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_tracks_spotify_id ON public.tracks(spotify_id);
CREATE INDEX IF NOT EXISTS idx_tracks_itunes_id ON public.tracks(itunes_id);
CREATE INDEX IF NOT EXISTS idx_tracks_title_artist ON public.tracks(title, artist);
CREATE INDEX IF NOT EXISTS idx_tracks_created_at ON public.tracks(created_at);
CREATE INDEX IF NOT EXISTS idx_tracks_itunes_track_id ON public.tracks(itunes_track_id);

-- Add updated_at trigger
CREATE TRIGGER update_tracks_updated_at
  BEFORE UPDATE ON public.tracks
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at();