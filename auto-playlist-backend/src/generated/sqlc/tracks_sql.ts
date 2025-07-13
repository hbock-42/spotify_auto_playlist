import { QueryArrayConfig, QueryArrayResult } from "pg";

interface Client {
    query: (config: QueryArrayConfig) => Promise<QueryArrayResult>;
}

export const createTrackQuery = `-- name: CreateTrack :one

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
  updated_at`;

export interface CreateTrackArgs {
    title: string;
    artist: string;
    durationMs: string | null;
    itunesId: string | null;
    previewUrl: string | null;
    spotifyId: string | null;
    artworkUrl: string | null;
    genre: string | null;
    releaseDate: string | null;
}

export interface CreateTrackRow {
    id: string;
    title: string;
    artist: string;
    durationMs: number | null;
    itunesId: string | null;
    previewUrl: string | null;
    spotifyId: string | null;
    artworkUrl: string | null;
    genre: string | null;
    releaseDate: string | null;
    createdAt: Date;
    updatedAt: Date;
}

export async function createTrack(client: Client, args: CreateTrackArgs): Promise<CreateTrackRow | null> {
    const result = await client.query({
        text: createTrackQuery,
        values: [args.title, args.artist, args.durationMs, args.itunesId, args.previewUrl, args.spotifyId, args.artworkUrl, args.genre, args.releaseDate],
        rowMode: "array"
    });
    if (result.rows.length !== 1) {
        return null;
    }
    const row = result.rows[0];
    return {
        id: row[0],
        title: row[1],
        artist: row[2],
        durationMs: row[3],
        itunesId: row[4],
        previewUrl: row[5],
        spotifyId: row[6],
        artworkUrl: row[7],
        genre: row[8],
        releaseDate: row[9],
        createdAt: row[10],
        updatedAt: row[11]
    };
}

export const getTrackByTitleArtistQuery = `-- name: GetTrackByTitleArtist :one
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
LIMIT 1`;

export interface GetTrackByTitleArtistArgs {
    title: string;
    artist: string;
}

export interface GetTrackByTitleArtistRow {
    id: string;
    title: string;
    artist: string;
    durationMs: number | null;
    itunesId: string | null;
    previewUrl: string | null;
    spotifyId: string | null;
    artworkUrl: string | null;
    genre: string | null;
    releaseDate: string | null;
    createdAt: Date;
    updatedAt: Date;
}

export async function getTrackByTitleArtist(client: Client, args: GetTrackByTitleArtistArgs): Promise<GetTrackByTitleArtistRow | null> {
    const result = await client.query({
        text: getTrackByTitleArtistQuery,
        values: [args.title, args.artist],
        rowMode: "array"
    });
    if (result.rows.length !== 1) {
        return null;
    }
    const row = result.rows[0];
    return {
        id: row[0],
        title: row[1],
        artist: row[2],
        durationMs: row[3],
        itunesId: row[4],
        previewUrl: row[5],
        spotifyId: row[6],
        artworkUrl: row[7],
        genre: row[8],
        releaseDate: row[9],
        createdAt: row[10],
        updatedAt: row[11]
    };
}

export const getTrackByIdQuery = `-- name: GetTrackById :one
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
LIMIT 1`;

export interface GetTrackByIdArgs {
    id: string;
}

export interface GetTrackByIdRow {
    id: string;
    title: string;
    artist: string;
    durationMs: number | null;
    itunesId: string | null;
    previewUrl: string | null;
    spotifyId: string | null;
    artworkUrl: string | null;
    genre: string | null;
    releaseDate: string | null;
    createdAt: Date;
    updatedAt: Date;
}

export async function getTrackById(client: Client, args: GetTrackByIdArgs): Promise<GetTrackByIdRow | null> {
    const result = await client.query({
        text: getTrackByIdQuery,
        values: [args.id],
        rowMode: "array"
    });
    if (result.rows.length !== 1) {
        return null;
    }
    const row = result.rows[0];
    return {
        id: row[0],
        title: row[1],
        artist: row[2],
        durationMs: row[3],
        itunesId: row[4],
        previewUrl: row[5],
        spotifyId: row[6],
        artworkUrl: row[7],
        genre: row[8],
        releaseDate: row[9],
        createdAt: row[10],
        updatedAt: row[11]
    };
}

export const getTrackByItunesIdQuery = `-- name: GetTrackByItunesId :one
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
LIMIT 1`;

export interface GetTrackByItunesIdArgs {
    itunesId: string | null;
}

export interface GetTrackByItunesIdRow {
    id: string;
    title: string;
    artist: string;
    durationMs: number | null;
    itunesId: string | null;
    previewUrl: string | null;
    spotifyId: string | null;
    artworkUrl: string | null;
    genre: string | null;
    releaseDate: string | null;
    createdAt: Date;
    updatedAt: Date;
}

export async function getTrackByItunesId(client: Client, args: GetTrackByItunesIdArgs): Promise<GetTrackByItunesIdRow | null> {
    const result = await client.query({
        text: getTrackByItunesIdQuery,
        values: [args.itunesId],
        rowMode: "array"
    });
    if (result.rows.length !== 1) {
        return null;
    }
    const row = result.rows[0];
    return {
        id: row[0],
        title: row[1],
        artist: row[2],
        durationMs: row[3],
        itunesId: row[4],
        previewUrl: row[5],
        spotifyId: row[6],
        artworkUrl: row[7],
        genre: row[8],
        releaseDate: row[9],
        createdAt: row[10],
        updatedAt: row[11]
    };
}

