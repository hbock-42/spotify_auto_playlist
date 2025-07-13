-- Analysis cache queries for auto-playlist backend

-- name: GetAnalysisCacheByTrackId :one
SELECT 
  id, 
  track_id, 
  audio_features_id, 
  analysis_status, 
  error_message, 
  cache_hit_count, 
  created_at, 
  updated_at
FROM analysis_cache 
WHERE track_id = $1
LIMIT 1;

-- name: CreateAnalysisCache :one
INSERT INTO analysis_cache (
  track_id, 
  analysis_status, 
  error_message
)
VALUES (
  $1, 
  $2, 
  $3
)
RETURNING 
  id, 
  track_id, 
  audio_features_id, 
  analysis_status, 
  error_message, 
  cache_hit_count, 
  created_at, 
  updated_at;

-- name: UpdateAnalysisCache :one
UPDATE analysis_cache 
SET 
  audio_features_id = $2,
  analysis_status = $3,
  error_message = $4,
  cache_hit_count = cache_hit_count + 1
WHERE track_id = $1
RETURNING 
  id, 
  track_id, 
  audio_features_id, 
  analysis_status, 
  error_message, 
  cache_hit_count, 
  created_at, 
  updated_at;

-- name: DeleteAnalysisCacheByTrackId :exec
DELETE FROM analysis_cache 
WHERE track_id = $1;

-- name: GetPendingAnalyses :many
SELECT 
  id, 
  track_id, 
  audio_features_id, 
  analysis_status, 
  error_message, 
  cache_hit_count, 
  created_at, 
  updated_at
FROM analysis_cache 
WHERE analysis_status = 'pending'
ORDER BY created_at ASC;