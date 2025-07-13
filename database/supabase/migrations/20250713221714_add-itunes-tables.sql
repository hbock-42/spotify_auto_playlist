alter table "public"."analysis_cache" drop constraint "analysis_cache_analysis_status_check";

create table "public"."itunes_search_queries" (
    "id" uuid not null default gen_random_uuid(),
    "search_title" character varying(255) not null,
    "search_artist" character varying(255) not null,
    "search_query_hash" character varying(64) not null,
    "found_track" boolean not null default false,
    "itunes_track_id" bigint,
    "cache_hit_count" integer not null default 0,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
);


create table "public"."itunes_tracks" (
    "id" uuid not null default gen_random_uuid(),
    "itunes_id" bigint not null,
    "track_name" character varying(255) not null,
    "artist_name" character varying(255) not null,
    "preview_url" text,
    "artwork_url_100" text,
    "primary_genre_name" character varying(100),
    "release_date" date,
    "track_time_millis" integer,
    "collection_name" character varying(255),
    "itunes_response_json" jsonb,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
);


alter table "public"."tracks" add column "itunes_track_id" uuid;

CREATE INDEX idx_itunes_search_queries_cache_hit_count ON public.itunes_search_queries USING btree (cache_hit_count);

CREATE INDEX idx_itunes_search_queries_created_at ON public.itunes_search_queries USING btree (created_at);

CREATE INDEX idx_itunes_search_queries_found_track ON public.itunes_search_queries USING btree (found_track);

CREATE UNIQUE INDEX idx_itunes_search_queries_hash ON public.itunes_search_queries USING btree (search_query_hash);

CREATE INDEX idx_itunes_tracks_artist_name ON public.itunes_tracks USING btree (artist_name);

CREATE INDEX idx_itunes_tracks_created_at ON public.itunes_tracks USING btree (created_at);

CREATE INDEX idx_itunes_tracks_genre ON public.itunes_tracks USING btree (primary_genre_name);

CREATE UNIQUE INDEX idx_itunes_tracks_itunes_id ON public.itunes_tracks USING btree (itunes_id);

CREATE INDEX idx_itunes_tracks_track_name ON public.itunes_tracks USING btree (track_name);

CREATE INDEX idx_tracks_itunes_track_id ON public.tracks USING btree (itunes_track_id);

CREATE UNIQUE INDEX itunes_search_queries_pkey ON public.itunes_search_queries USING btree (id);

CREATE UNIQUE INDEX itunes_search_queries_search_query_hash_key ON public.itunes_search_queries USING btree (search_query_hash);

CREATE UNIQUE INDEX itunes_tracks_itunes_id_key ON public.itunes_tracks USING btree (itunes_id);

CREATE UNIQUE INDEX itunes_tracks_pkey ON public.itunes_tracks USING btree (id);

alter table "public"."itunes_search_queries" add constraint "itunes_search_queries_pkey" PRIMARY KEY using index "itunes_search_queries_pkey";

alter table "public"."itunes_tracks" add constraint "itunes_tracks_pkey" PRIMARY KEY using index "itunes_tracks_pkey";

alter table "public"."itunes_search_queries" add constraint "itunes_search_queries_itunes_track_id_fkey" FOREIGN KEY (itunes_track_id) REFERENCES itunes_tracks(itunes_id) not valid;

alter table "public"."itunes_search_queries" validate constraint "itunes_search_queries_itunes_track_id_fkey";

alter table "public"."itunes_search_queries" add constraint "itunes_search_queries_search_query_hash_key" UNIQUE using index "itunes_search_queries_search_query_hash_key";

alter table "public"."itunes_tracks" add constraint "itunes_tracks_itunes_id_key" UNIQUE using index "itunes_tracks_itunes_id_key";

alter table "public"."tracks" add constraint "tracks_itunes_track_id_fkey" FOREIGN KEY (itunes_track_id) REFERENCES itunes_tracks(id) not valid;

alter table "public"."tracks" validate constraint "tracks_itunes_track_id_fkey";

alter table "public"."analysis_cache" add constraint "analysis_cache_analysis_status_check" CHECK (((analysis_status)::text = ANY ((ARRAY['pending'::character varying, 'completed'::character varying, 'failed'::character varying])::text[]))) not valid;

alter table "public"."analysis_cache" validate constraint "analysis_cache_analysis_status_check";

grant delete on table "public"."itunes_search_queries" to "anon";

grant insert on table "public"."itunes_search_queries" to "anon";

grant references on table "public"."itunes_search_queries" to "anon";

grant select on table "public"."itunes_search_queries" to "anon";

grant trigger on table "public"."itunes_search_queries" to "anon";

grant truncate on table "public"."itunes_search_queries" to "anon";

grant update on table "public"."itunes_search_queries" to "anon";

grant delete on table "public"."itunes_search_queries" to "authenticated";

grant insert on table "public"."itunes_search_queries" to "authenticated";

grant references on table "public"."itunes_search_queries" to "authenticated";

grant select on table "public"."itunes_search_queries" to "authenticated";

grant trigger on table "public"."itunes_search_queries" to "authenticated";

grant truncate on table "public"."itunes_search_queries" to "authenticated";

grant update on table "public"."itunes_search_queries" to "authenticated";

grant delete on table "public"."itunes_search_queries" to "service_role";

grant insert on table "public"."itunes_search_queries" to "service_role";

grant references on table "public"."itunes_search_queries" to "service_role";

grant select on table "public"."itunes_search_queries" to "service_role";

grant trigger on table "public"."itunes_search_queries" to "service_role";

grant truncate on table "public"."itunes_search_queries" to "service_role";

grant update on table "public"."itunes_search_queries" to "service_role";

grant delete on table "public"."itunes_tracks" to "anon";

grant insert on table "public"."itunes_tracks" to "anon";

grant references on table "public"."itunes_tracks" to "anon";

grant select on table "public"."itunes_tracks" to "anon";

grant trigger on table "public"."itunes_tracks" to "anon";

grant truncate on table "public"."itunes_tracks" to "anon";

grant update on table "public"."itunes_tracks" to "anon";

grant delete on table "public"."itunes_tracks" to "authenticated";

grant insert on table "public"."itunes_tracks" to "authenticated";

grant references on table "public"."itunes_tracks" to "authenticated";

grant select on table "public"."itunes_tracks" to "authenticated";

grant trigger on table "public"."itunes_tracks" to "authenticated";

grant truncate on table "public"."itunes_tracks" to "authenticated";

grant update on table "public"."itunes_tracks" to "authenticated";

grant delete on table "public"."itunes_tracks" to "service_role";

grant insert on table "public"."itunes_tracks" to "service_role";

grant references on table "public"."itunes_tracks" to "service_role";

grant select on table "public"."itunes_tracks" to "service_role";

grant trigger on table "public"."itunes_tracks" to "service_role";

grant truncate on table "public"."itunes_tracks" to "service_role";

grant update on table "public"."itunes_tracks" to "service_role";

CREATE TRIGGER update_itunes_search_queries_updated_at BEFORE UPDATE ON public.itunes_search_queries FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_itunes_tracks_updated_at BEFORE UPDATE ON public.itunes_tracks FOR EACH ROW EXECUTE FUNCTION update_updated_at();


