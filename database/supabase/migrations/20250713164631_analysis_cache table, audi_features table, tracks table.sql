create table "public"."analysis_cache" (
    "id" uuid not null default gen_random_uuid(),
    "track_id" uuid not null,
    "audio_features_id" uuid,
    "analysis_status" character varying(20) not null,
    "error_message" text,
    "cache_hit_count" integer not null default 0,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
);


create table "public"."audio_features" (
    "id" uuid not null default gen_random_uuid(),
    "track_id" uuid not null,
    "energy" real not null,
    "danceability" real not null,
    "valence" real not null,
    "tempo" real not null,
    "acousticness" real not null,
    "instrumentalness" real,
    "liveness" real,
    "speechiness" real,
    "loudness" real,
    "analysis_confidence" real not null,
    "analysis_duration_ms" integer not null,
    "created_at" timestamp with time zone not null default now()
);


create table "public"."tracks" (
    "id" uuid not null default gen_random_uuid(),
    "spotify_id" character varying(255),
    "itunes_id" character varying(255),
    "title" character varying(500) not null,
    "artist" character varying(500) not null,
    "duration_ms" integer,
    "preview_url" text,
    "artwork_url" text,
    "genre" character varying(100),
    "release_date" character varying(50),
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
);


CREATE UNIQUE INDEX analysis_cache_pkey ON public.analysis_cache USING btree (id);

CREATE UNIQUE INDEX analysis_cache_track_id_key ON public.analysis_cache USING btree (track_id);

CREATE UNIQUE INDEX audio_features_pkey ON public.audio_features USING btree (id);

CREATE INDEX idx_analysis_cache_created_at ON public.analysis_cache USING btree (created_at);

CREATE INDEX idx_analysis_cache_status ON public.analysis_cache USING btree (analysis_status);

CREATE INDEX idx_analysis_cache_track_id ON public.analysis_cache USING btree (track_id);

CREATE INDEX idx_audio_features_danceability ON public.audio_features USING btree (danceability);

CREATE INDEX idx_audio_features_energy ON public.audio_features USING btree (energy);

CREATE INDEX idx_audio_features_tempo ON public.audio_features USING btree (tempo);

CREATE UNIQUE INDEX idx_audio_features_track_id ON public.audio_features USING btree (track_id);

CREATE INDEX idx_audio_features_valence ON public.audio_features USING btree (valence);

CREATE INDEX idx_tracks_created_at ON public.tracks USING btree (created_at);

CREATE INDEX idx_tracks_itunes_id ON public.tracks USING btree (itunes_id);

CREATE INDEX idx_tracks_spotify_id ON public.tracks USING btree (spotify_id);

CREATE INDEX idx_tracks_title_artist ON public.tracks USING btree (title, artist);

CREATE UNIQUE INDEX tracks_itunes_id_key ON public.tracks USING btree (itunes_id);

CREATE UNIQUE INDEX tracks_pkey ON public.tracks USING btree (id);

CREATE UNIQUE INDEX tracks_spotify_id_key ON public.tracks USING btree (spotify_id);

alter table "public"."analysis_cache" add constraint "analysis_cache_pkey" PRIMARY KEY using index "analysis_cache_pkey";

alter table "public"."audio_features" add constraint "audio_features_pkey" PRIMARY KEY using index "audio_features_pkey";

alter table "public"."tracks" add constraint "tracks_pkey" PRIMARY KEY using index "tracks_pkey";

alter table "public"."analysis_cache" add constraint "analysis_cache_analysis_status_check" CHECK (((analysis_status)::text = ANY ((ARRAY['pending'::character varying, 'completed'::character varying, 'failed'::character varying])::text[]))) not valid;

alter table "public"."analysis_cache" validate constraint "analysis_cache_analysis_status_check";

alter table "public"."analysis_cache" add constraint "analysis_cache_audio_features_id_fkey" FOREIGN KEY (audio_features_id) REFERENCES audio_features(id) ON DELETE SET NULL not valid;

alter table "public"."analysis_cache" validate constraint "analysis_cache_audio_features_id_fkey";

alter table "public"."analysis_cache" add constraint "analysis_cache_track_id_fkey" FOREIGN KEY (track_id) REFERENCES tracks(id) ON DELETE CASCADE not valid;

alter table "public"."analysis_cache" validate constraint "analysis_cache_track_id_fkey";

alter table "public"."analysis_cache" add constraint "analysis_cache_track_id_key" UNIQUE using index "analysis_cache_track_id_key";

alter table "public"."audio_features" add constraint "audio_features_acousticness_check" CHECK (((acousticness >= (0)::double precision) AND (acousticness <= (1)::double precision))) not valid;

alter table "public"."audio_features" validate constraint "audio_features_acousticness_check";

alter table "public"."audio_features" add constraint "audio_features_analysis_confidence_check" CHECK (((analysis_confidence >= (0)::double precision) AND (analysis_confidence <= (1)::double precision))) not valid;

alter table "public"."audio_features" validate constraint "audio_features_analysis_confidence_check";

alter table "public"."audio_features" add constraint "audio_features_analysis_duration_ms_check" CHECK ((analysis_duration_ms > 0)) not valid;

alter table "public"."audio_features" validate constraint "audio_features_analysis_duration_ms_check";

alter table "public"."audio_features" add constraint "audio_features_danceability_check" CHECK (((danceability >= (0)::double precision) AND (danceability <= (1)::double precision))) not valid;

alter table "public"."audio_features" validate constraint "audio_features_danceability_check";

alter table "public"."audio_features" add constraint "audio_features_energy_check" CHECK (((energy >= (0)::double precision) AND (energy <= (1)::double precision))) not valid;

alter table "public"."audio_features" validate constraint "audio_features_energy_check";

alter table "public"."audio_features" add constraint "audio_features_instrumentalness_check" CHECK (((instrumentalness >= (0)::double precision) AND (instrumentalness <= (1)::double precision))) not valid;

alter table "public"."audio_features" validate constraint "audio_features_instrumentalness_check";

alter table "public"."audio_features" add constraint "audio_features_liveness_check" CHECK (((liveness >= (0)::double precision) AND (liveness <= (1)::double precision))) not valid;

alter table "public"."audio_features" validate constraint "audio_features_liveness_check";

alter table "public"."audio_features" add constraint "audio_features_speechiness_check" CHECK (((speechiness >= (0)::double precision) AND (speechiness <= (1)::double precision))) not valid;

alter table "public"."audio_features" validate constraint "audio_features_speechiness_check";

alter table "public"."audio_features" add constraint "audio_features_tempo_check" CHECK ((tempo > (0)::double precision)) not valid;

alter table "public"."audio_features" validate constraint "audio_features_tempo_check";

alter table "public"."audio_features" add constraint "audio_features_track_id_fkey" FOREIGN KEY (track_id) REFERENCES tracks(id) ON DELETE CASCADE not valid;

alter table "public"."audio_features" validate constraint "audio_features_track_id_fkey";

alter table "public"."audio_features" add constraint "audio_features_valence_check" CHECK (((valence >= (0)::double precision) AND (valence <= (1)::double precision))) not valid;

alter table "public"."audio_features" validate constraint "audio_features_valence_check";

alter table "public"."tracks" add constraint "tracks_itunes_id_key" UNIQUE using index "tracks_itunes_id_key";

alter table "public"."tracks" add constraint "tracks_spotify_id_key" UNIQUE using index "tracks_spotify_id_key";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.update_updated_at()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$function$
;

grant delete on table "public"."analysis_cache" to "anon";

grant insert on table "public"."analysis_cache" to "anon";

grant references on table "public"."analysis_cache" to "anon";

grant select on table "public"."analysis_cache" to "anon";

grant trigger on table "public"."analysis_cache" to "anon";

grant truncate on table "public"."analysis_cache" to "anon";

grant update on table "public"."analysis_cache" to "anon";

grant delete on table "public"."analysis_cache" to "authenticated";

grant insert on table "public"."analysis_cache" to "authenticated";

grant references on table "public"."analysis_cache" to "authenticated";

grant select on table "public"."analysis_cache" to "authenticated";

grant trigger on table "public"."analysis_cache" to "authenticated";

grant truncate on table "public"."analysis_cache" to "authenticated";

grant update on table "public"."analysis_cache" to "authenticated";

grant delete on table "public"."analysis_cache" to "service_role";

grant insert on table "public"."analysis_cache" to "service_role";

grant references on table "public"."analysis_cache" to "service_role";

grant select on table "public"."analysis_cache" to "service_role";

grant trigger on table "public"."analysis_cache" to "service_role";

grant truncate on table "public"."analysis_cache" to "service_role";

grant update on table "public"."analysis_cache" to "service_role";

grant delete on table "public"."audio_features" to "anon";

grant insert on table "public"."audio_features" to "anon";

grant references on table "public"."audio_features" to "anon";

grant select on table "public"."audio_features" to "anon";

grant trigger on table "public"."audio_features" to "anon";

grant truncate on table "public"."audio_features" to "anon";

grant update on table "public"."audio_features" to "anon";

grant delete on table "public"."audio_features" to "authenticated";

grant insert on table "public"."audio_features" to "authenticated";

grant references on table "public"."audio_features" to "authenticated";

grant select on table "public"."audio_features" to "authenticated";

grant trigger on table "public"."audio_features" to "authenticated";

grant truncate on table "public"."audio_features" to "authenticated";

grant update on table "public"."audio_features" to "authenticated";

grant delete on table "public"."audio_features" to "service_role";

grant insert on table "public"."audio_features" to "service_role";

grant references on table "public"."audio_features" to "service_role";

grant select on table "public"."audio_features" to "service_role";

grant trigger on table "public"."audio_features" to "service_role";

grant truncate on table "public"."audio_features" to "service_role";

grant update on table "public"."audio_features" to "service_role";

grant delete on table "public"."tracks" to "anon";

grant insert on table "public"."tracks" to "anon";

grant references on table "public"."tracks" to "anon";

grant select on table "public"."tracks" to "anon";

grant trigger on table "public"."tracks" to "anon";

grant truncate on table "public"."tracks" to "anon";

grant update on table "public"."tracks" to "anon";

grant delete on table "public"."tracks" to "authenticated";

grant insert on table "public"."tracks" to "authenticated";

grant references on table "public"."tracks" to "authenticated";

grant select on table "public"."tracks" to "authenticated";

grant trigger on table "public"."tracks" to "authenticated";

grant truncate on table "public"."tracks" to "authenticated";

grant update on table "public"."tracks" to "authenticated";

grant delete on table "public"."tracks" to "service_role";

grant insert on table "public"."tracks" to "service_role";

grant references on table "public"."tracks" to "service_role";

grant select on table "public"."tracks" to "service_role";

grant trigger on table "public"."tracks" to "service_role";

grant truncate on table "public"."tracks" to "service_role";

grant update on table "public"."tracks" to "service_role";

CREATE TRIGGER update_analysis_cache_updated_at BEFORE UPDATE ON public.analysis_cache FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_tracks_updated_at BEFORE UPDATE ON public.tracks FOR EACH ROW EXECUTE FUNCTION update_updated_at();


