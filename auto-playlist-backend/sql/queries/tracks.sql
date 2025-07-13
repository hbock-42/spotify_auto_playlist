-- Track-related queries for auto-playlist backend

-- name: CreateTrack :one
INSERT INTO tracks (
  title, 
  artist, 
  duration_ms, 
  itunes_id, 
  preview_url,
  spotify_id,
  artwork_url,
  genre,
  release_date
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
  $9
)
RETURNING 
  id, 
  title, 
  artist, 
  duration_ms, 
  itunes_id, 
  preview_url, 
  spotify_id,
  artwork_url,
  genre,
  release_date,
  created_at, 
  updated_at;

-- name: GetTrackByTitleArtist :one
SELECT 
  id, 
  title, 
  artist, 
  duration_ms, 
  itunes_id, 
  preview_url, 
  spotify_id,
  artwork_url,
  genre,
  release_date,
  created_at, 
  updated_at
FROM tracks 
WHERE title = $1 AND artist = $2
LIMIT 1;

-- name: GetTrackById :one
SELECT 
  id, 
  title, 
  artist, 
  duration_ms, 
  itunes_id, 
  preview_url, 
  spotify_id,
  artwork_url,
  genre,
  release_date,
  created_at, 
  updated_at
FROM tracks 
WHERE id = $1
LIMIT 1;

-- name: GetTrackByItunesId :one
SELECT 
  id, 
  title, 
  artist, 
  duration_ms, 
  itunes_id, 
  preview_url, 
  spotify_id,
  artwork_url,
  genre,
  release_date,
  created_at, 
  updated_at
FROM tracks 
WHERE itunes_id = $1
LIMIT 1;