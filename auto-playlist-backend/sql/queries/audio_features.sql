-- Audio features queries for auto-playlist backend

-- name: CreateAudioFeatures :one
INSERT INTO audio_features (
  track_id, 
  energy, 
  danceability, 
  valence, 
  tempo, 
  acousticness, 
  instrumentalness,
  liveness,
  speechiness,
  loudness,
  analysis_confidence,
  analysis_duration_ms
)
VALUES (
  $1, 
  $2, 
  $3, 
  $4, 
  $5, 
  $6, 
  $7, 
  $8, 
  $9, 
  $10,
  $11,
  $12
)
ON CONFLICT (track_id) 
DO UPDATE SET 
  energy = EXCLUDED.energy,
  danceability = EXCLUDED.danceability,
  valence = EXCLUDED.valence,
  tempo = EXCLUDED.tempo,
  acousticness = EXCLUDED.acousticness,
  instrumentalness = EXCLUDED.instrumentalness,
  liveness = EXCLUDED.liveness,
  speechiness = EXCLUDED.speechiness,
  loudness = EXCLUDED.loudness,
  analysis_confidence = EXCLUDED.analysis_confidence,
  analysis_duration_ms = EXCLUDED.analysis_duration_ms
RETURNING 
  id, 
  track_id, 
  energy, 
  danceability, 
  valence, 
  tempo, 
  acousticness, 
  instrumentalness,
  liveness,
  speechiness,
  loudness,
  analysis_confidence,
  analysis_duration_ms,
  created_at;

-- name: GetAudioFeaturesByTrackId :one
SELECT 
  id, 
  track_id, 
  energy, 
  danceability, 
  valence, 
  tempo, 
  acousticness, 
  instrumentalness,
  liveness,
  speechiness,
  loudness,
  analysis_confidence,
  analysis_duration_ms,
  created_at
FROM audio_features 
WHERE track_id = $1
LIMIT 1;

-- name: GetTrackWithFeatures :one
SELECT 
  t.id, 
  t.title, 
  t.artist, 
  t.duration_ms, 
  t.itunes_id, 
  t.preview_url, 
  t.created_at, 
  t.updated_at,
  af.energy, 
  af.danceability, 
  af.valence, 
  af.tempo, 
  af.acousticness, 
  af.instrumentalness,
  af.liveness,
  af.speechiness,
  af.loudness,
  af.analysis_confidence,
  af.analysis_duration_ms,
  af.created_at as features_created_at
FROM tracks t
LEFT JOIN audio_features af ON t.id = af.track_id
WHERE t.title = $1 AND t.artist = $2
LIMIT 1;