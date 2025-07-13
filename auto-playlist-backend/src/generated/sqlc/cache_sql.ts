import { QueryArrayConfig, QueryArrayResult } from "pg";

interface Client {
    query: (config: QueryArrayConfig) => Promise<QueryArrayResult>;
}

export const getAnalysisCacheByTrackIdQuery = `-- name: GetAnalysisCacheByTrackId :one

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
LIMIT 1`;

export interface GetAnalysisCacheByTrackIdArgs {
    trackId: string;
}

export interface GetAnalysisCacheByTrackIdRow {
    id: string;
    trackId: string;
    audioFeaturesId: string | null;
    analysisStatus: string;
    errorMessage: string | null;
    cacheHitCount: number;
    createdAt: Date;
    updatedAt: Date;
}

export async function getAnalysisCacheByTrackId(client: Client, args: GetAnalysisCacheByTrackIdArgs): Promise<GetAnalysisCacheByTrackIdRow | null> {
    const result = await client.query({
        text: getAnalysisCacheByTrackIdQuery,
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
        audioFeaturesId: row[2],
        analysisStatus: row[3],
        errorMessage: row[4],
        cacheHitCount: row[5],
        createdAt: row[6],
        updatedAt: row[7]
    };
}

export const createAnalysisCacheQuery = `-- name: CreateAnalysisCache :one
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
  updated_at`;

export interface CreateAnalysisCacheArgs {
    trackId: string;
    analysisStatus: string;
    errorMessage: string | null;
}

export interface CreateAnalysisCacheRow {
    id: string;
    trackId: string;
    audioFeaturesId: string | null;
    analysisStatus: string;
    errorMessage: string | null;
    cacheHitCount: number;
    createdAt: Date;
    updatedAt: Date;
}

export async function createAnalysisCache(client: Client, args: CreateAnalysisCacheArgs): Promise<CreateAnalysisCacheRow | null> {
    const result = await client.query({
        text: createAnalysisCacheQuery,
        values: [args.trackId, args.analysisStatus, args.errorMessage],
        rowMode: "array"
    });
    if (result.rows.length !== 1) {
        return null;
    }
    const row = result.rows[0];
    return {
        id: row[0],
        trackId: row[1],
        audioFeaturesId: row[2],
        analysisStatus: row[3],
        errorMessage: row[4],
        cacheHitCount: row[5],
        createdAt: row[6],
        updatedAt: row[7]
    };
}

export const updateAnalysisCacheQuery = `-- name: UpdateAnalysisCache :one
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
  updated_at`;

export interface UpdateAnalysisCacheArgs {
    trackId: string;
    audioFeaturesId: string | null;
    analysisStatus: string;
    errorMessage: string | null;
}

export interface UpdateAnalysisCacheRow {
    id: string;
    trackId: string;
    audioFeaturesId: string | null;
    analysisStatus: string;
    errorMessage: string | null;
    cacheHitCount: number;
    createdAt: Date;
    updatedAt: Date;
}

export async function updateAnalysisCache(client: Client, args: UpdateAnalysisCacheArgs): Promise<UpdateAnalysisCacheRow | null> {
    const result = await client.query({
        text: updateAnalysisCacheQuery,
        values: [args.trackId, args.audioFeaturesId, args.analysisStatus, args.errorMessage],
        rowMode: "array"
    });
    if (result.rows.length !== 1) {
        return null;
    }
    const row = result.rows[0];
    return {
        id: row[0],
        trackId: row[1],
        audioFeaturesId: row[2],
        analysisStatus: row[3],
        errorMessage: row[4],
        cacheHitCount: row[5],
        createdAt: row[6],
        updatedAt: row[7]
    };
}

export const deleteAnalysisCacheByTrackIdQuery = `-- name: DeleteAnalysisCacheByTrackId :exec
DELETE FROM analysis_cache 
WHERE track_id = $1`;

export interface DeleteAnalysisCacheByTrackIdArgs {
    trackId: string;
}

export async function deleteAnalysisCacheByTrackId(client: Client, args: DeleteAnalysisCacheByTrackIdArgs): Promise<void> {
    await client.query({
        text: deleteAnalysisCacheByTrackIdQuery,
        values: [args.trackId],
        rowMode: "array"
    });
}

export const getPendingAnalysesQuery = `-- name: GetPendingAnalyses :many
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
ORDER BY created_at ASC`;

export interface GetPendingAnalysesRow {
    id: string;
    trackId: string;
    audioFeaturesId: string | null;
    analysisStatus: string;
    errorMessage: string | null;
    cacheHitCount: number;
    createdAt: Date;
    updatedAt: Date;
}

export async function getPendingAnalyses(client: Client): Promise<GetPendingAnalysesRow[]> {
    const result = await client.query({
        text: getPendingAnalysesQuery,
        values: [],
        rowMode: "array"
    });
    return result.rows.map(row => {
        return {
            id: row[0],
            trackId: row[1],
            audioFeaturesId: row[2],
            analysisStatus: row[3],
            errorMessage: row[4],
            cacheHitCount: row[5],
            createdAt: row[6],
            updatedAt: row[7]
        };
    });
}

