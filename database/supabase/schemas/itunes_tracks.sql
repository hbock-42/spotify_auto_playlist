-- iTunes tracks table for storing iTunes track metadata
CREATE TABLE IF NOT EXISTS public.itunes_tracks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  itunes_id BIGINT UNIQUE NOT NULL,
  track_name VARCHAR(255) NOT NULL,
  artist_name VARCHAR(255) NOT NULL,
  preview_url TEXT,
  artwork_url_100 TEXT,
  primary_genre_name VARCHAR(100),
  release_date DATE,
  track_time_millis INTEGER,
  collection_name VARCHAR(255),
  itunes_response_json JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for better query performance
CREATE UNIQUE INDEX IF NOT EXISTS idx_itunes_tracks_itunes_id ON public.itunes_tracks(itunes_id);
CREATE INDEX IF NOT EXISTS idx_itunes_tracks_track_name ON public.itunes_tracks(track_name);
CREATE INDEX IF NOT EXISTS idx_itunes_tracks_artist_name ON public.itunes_tracks(artist_name);
CREATE INDEX IF NOT EXISTS idx_itunes_tracks_genre ON public.itunes_tracks(primary_genre_name);
CREATE INDEX IF NOT EXISTS idx_itunes_tracks_created_at ON public.itunes_tracks(created_at);

-- Add updated_at trigger
CREATE TRIGGER update_itunes_tracks_updated_at
  BEFORE UPDATE ON public.itunes_tracks
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at();