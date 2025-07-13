import { QueryArrayConfig, QueryArrayResult } from "pg";

interface Client {
    query: (config: QueryArrayConfig) => Promise<QueryArrayResult>;
}

export const createAudioFeaturesQuery = `-- name: CreateAudioFeatures :one

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
  created_at`;

export interface CreateAudioFeaturesArgs {
    trackId: string;
    energy: string;
    danceability: string;
    valence: string;
    tempo: string;
    acousticness: string;
    instrumentalness: string | null;
    liveness: string | null;
    speechiness: string | null;
    loudness: string | null;
    analysisConfidence: string;
    analysisDurationMs: string;
}

export interface CreateAudioFeaturesRow {
    id: string;
    trackId: string;
    energy: number;
    danceability: number;
    valence: number;
    tempo: number;
    acousticness: number;
    instrumentalness: number | null;
    liveness: number | null;
    speechiness: number | null;
    loudness: number | null;
    analysisConfidence: number;
    analysisDurationMs: number;
    createdAt: Date;
}

export async function createAudioFeatures(client: Client, args: CreateAudioFeaturesArgs): Promise<CreateAudioFeaturesRow | null> {
    const result = await client.query({
        text: createAudioFeaturesQuery,
        values: [args.trackId, args.energy, args.danceability, args.valence, args.tempo, args.acousticness, args.instrumentalness, args.liveness, args.speechiness, args.loudness, args.analysisConfidence, args.analysisDurationMs],
        rowMode: "array"
    });
    if (result.rows.length !== 1) {
        return null;
    }
    const row = result.rows[0];
    return {
        id: row[0],
        trackId: row[1],
        energy: row[2],
        danceability: row[3],
        valence: row[4],
        tempo: row[5],
        acousticness: row[6],
        instrumentalness: row[7],
        liveness: row[8],
        speechiness: row[9],
        loudness: row[10],
        analysisConfidence: row[11],
        analysisDurationMs: row[12],
        createdAt: row[13]
    };
}

export const getAudioFeaturesByTrackIdQuery = `-- name: GetAudioFeaturesByTrackId :one
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
LIMIT 1`;

export interface GetAudioFeaturesByTrackIdArgs {
    trackId: string;
}

export interface GetAudioFeaturesByTrackIdRow {
    id: string;
    trackId: string;
    energy: number;
    danceability: number;
    valence: number;
    tempo: number;
    acousticness: number;
    instrumentalness: number | null;
    liveness: number | null;
    speechiness: number | null;
    loudness: number | null;
    analysisConfidence: number;
    analysisDurationMs: number;
    createdAt: Date;
}

export async function getAudioFeaturesByTrackId(client: Client, args: GetAudioFeaturesByTrackIdArgs): Promise<GetAudioFeaturesByTrackIdRow | null> {
    const result = await client.query({
        text: getAudioFeaturesByTrackIdQuery,
        values: [args.trackId],
        rowMode: "array"
    });
    if (result.rows.length !== 1) {
        return null;
    }
    const row = result.rows[0];
    return {
        id: row[0],
        trackId: row[1],
        energy: row[2],
        danceability: row[3],
        valence: row[4],
        tempo: row[5],
        acousticness: row[6],
        instrumentalness: row[7],
        liveness: row[8],
        speechiness: row[9],
        loudness: row[10],
        analysisConfidence: row[11],
        analysisDurationMs: row[12],
        createdAt: row[13]
    };
}

export const getTrackWithFeaturesQuery = `-- name: GetTrackWithFeatures :one
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
LIMIT 1`;

export interface GetTrackWithFeaturesArgs {
    title: string;
    artist: string;
}

export interface GetTrackWithFeaturesRow {
    id: string;
    title: string;
    artist: string;
    durationMs: number | null;
    itunesId: string | null;
    previewUrl: string | null;
    createdAt: Date;
    updatedAt: Date;
    energy: number | null;
    danceability: number | null;
    valence: number | null;
    tempo: number | null;
    acousticness: number | null;
    instrumentalness: number | null;
    liveness: number | null;
    speechiness: number | null;
    loudness: number | null;
    analysisConfidence: number | null;
    analysisDurationMs: number | null;
    featuresCreatedAt: Date | null;
}

export async function getTrackWithFeatures(client: Client, args: GetTrackWithFeaturesArgs): Promise<GetTrackWithFeaturesRow | null> {
    const result = await client.query({
        text: getTrackWithFeaturesQuery,
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
        createdAt: row[6],
        updatedAt: row[7],
        energy: row[8],
        danceability: row[9],
        valence: row[10],
        tempo: row[11],
        acousticness: row[12],
        instrumentalness: row[13],
        liveness: row[14],
        speechiness: row[15],
        loudness: row[16],
        analysisConfidence: row[17],
        analysisDurationMs: row[18],
        featuresCreatedAt: row[19]
    };
}

