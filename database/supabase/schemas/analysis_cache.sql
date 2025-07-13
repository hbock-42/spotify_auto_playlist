-- Analysis cache table for storing track analysis results and status
CREATE TABLE IF NOT EXISTS public.analysis_cache (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  track_id UUID NOT NULL UNIQUE REFERENCES public.tracks(id) ON DELETE CASCADE,
  audio_features_id UUID REFERENCES public.audio_features(id) ON DELETE SET NULL,
  analysis_status VARCHAR(20) NOT NULL CHECK (analysis_status IN ('pending', 'completed', 'failed')),
  error_message TEXT,
  cache_hit_count INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_analysis_cache_track_id ON public.analysis_cache(track_id);
CREATE INDEX IF NOT EXISTS idx_analysis_cache_status ON public.analysis_cache(analysis_status);
CREATE INDEX IF NOT EXISTS idx_analysis_cache_created_at ON public.analysis_cache(created_at);

-- Add updated_at trigger
CREATE TRIGGER update_analysis_cache_updated_at
  BEFORE UPDATE ON public.analysis_cache
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at();