-- iTunes search queries table for caching search performance
CREATE TABLE IF NOT EXISTS public.itunes_search_queries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  search_title VARCHAR(255) NOT NULL,
  search_artist VARCHAR(255) NOT NULL,
  search_query_hash VARCHAR(64) UNIQUE NOT NULL,
  found_track BOOLEAN NOT NULL DEFAULT false,
  itunes_track_id BIGINT REFERENCES public.itunes_tracks(itunes_id),
  cache_hit_count INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for better query performance
CREATE UNIQUE INDEX IF NOT EXISTS idx_itunes_search_queries_hash ON public.itunes_search_queries(search_query_hash);
CREATE INDEX IF NOT EXISTS idx_itunes_search_queries_found_track ON public.itunes_search_queries(found_track);
CREATE INDEX IF NOT EXISTS idx_itunes_search_queries_cache_hit_count ON public.itunes_search_queries(cache_hit_count);
CREATE INDEX IF NOT EXISTS idx_itunes_search_queries_created_at ON public.itunes_search_queries(created_at);

-- Add updated_at trigger
CREATE TRIGGER update_itunes_search_queries_updated_at
  BEFORE UPDATE ON public.itunes_search_queries
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at();