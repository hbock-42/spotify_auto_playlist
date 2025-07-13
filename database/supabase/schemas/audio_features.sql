-- Audio features table for storing analyzed audio characteristics
CREATE TABLE IF NOT EXISTS public.audio_features (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  track_id UUID NOT NULL REFERENCES public.tracks(id) ON DELETE CASCADE,
  energy REAL NOT NULL CHECK (energy >= 0 AND energy <= 1),
  danceability REAL NOT NULL CHECK (danceability >= 0 AND danceability <= 1),
  valence REAL NOT NULL CHECK (valence >= 0 AND valence <= 1),
  tempo REAL NOT NULL CHECK (tempo > 0),
  acousticness REAL NOT NULL CHECK (acousticness >= 0 AND acousticness <= 1),
  instrumentalness REAL CHECK (instrumentalness >= 0 AND instrumentalness <= 1),
  liveness REAL CHECK (liveness >= 0 AND liveness <= 1),
  speechiness REAL CHECK (speechiness >= 0 AND speechiness <= 1),
  loudness REAL,
  analysis_confidence REAL NOT NULL CHECK (analysis_confidence >= 0 AND analysis_confidence <= 1),
  analysis_duration_ms INTEGER NOT NULL CHECK (analysis_duration_ms > 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for better query performance
CREATE UNIQUE INDEX IF NOT EXISTS idx_audio_features_track_id ON public.audio_features(track_id);
CREATE INDEX IF NOT EXISTS idx_audio_features_energy ON public.audio_features(energy);
CREATE INDEX IF NOT EXISTS idx_audio_features_danceability ON public.audio_features(danceability);
CREATE INDEX IF NOT EXISTS idx_audio_features_valence ON public.audio_features(valence);
CREATE INDEX IF NOT EXISTS idx_audio_features_tempo ON public.audio_features(tempo);