

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "extensions";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."update_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_updated_at"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."analysis_cache" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "track_id" "uuid" NOT NULL,
    "audio_features_id" "uuid",
    "analysis_status" character varying(20) NOT NULL,
    "error_message" "text",
    "cache_hit_count" integer DEFAULT 0 NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "analysis_cache_analysis_status_check" CHECK ((("analysis_status")::"text" = ANY (ARRAY[('pending'::character varying)::"text", ('completed'::character varying)::"text", ('failed'::character varying)::"text"])))
);


ALTER TABLE "public"."analysis_cache" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."audio_features" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "track_id" "uuid" NOT NULL,
    "energy" real NOT NULL,
    "danceability" real NOT NULL,
    "valence" real NOT NULL,
    "tempo" real NOT NULL,
    "acousticness" real NOT NULL,
    "instrumentalness" real,
    "liveness" real,
    "speechiness" real,
    "loudness" real,
    "analysis_confidence" real NOT NULL,
    "analysis_duration_ms" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "audio_features_acousticness_check" CHECK ((("acousticness" >= (0)::double precision) AND ("acousticness" <= (1)::double precision))),
    CONSTRAINT "audio_features_analysis_confidence_check" CHECK ((("analysis_confidence" >= (0)::double precision) AND ("analysis_confidence" <= (1)::double precision))),
    CONSTRAINT "audio_features_analysis_duration_ms_check" CHECK (("analysis_duration_ms" > 0)),
    CONSTRAINT "audio_features_danceability_check" CHECK ((("danceability" >= (0)::double precision) AND ("danceability" <= (1)::double precision))),
    CONSTRAINT "audio_features_energy_check" CHECK ((("energy" >= (0)::double precision) AND ("energy" <= (1)::double precision))),
    CONSTRAINT "audio_features_instrumentalness_check" CHECK ((("instrumentalness" >= (0)::double precision) AND ("instrumentalness" <= (1)::double precision))),
    CONSTRAINT "audio_features_liveness_check" CHECK ((("liveness" >= (0)::double precision) AND ("liveness" <= (1)::double precision))),
    CONSTRAINT "audio_features_speechiness_check" CHECK ((("speechiness" >= (0)::double precision) AND ("speechiness" <= (1)::double precision))),
    CONSTRAINT "audio_features_tempo_check" CHECK (("tempo" > (0)::double precision)),
    CONSTRAINT "audio_features_valence_check" CHECK ((("valence" >= (0)::double precision) AND ("valence" <= (1)::double precision)))
);


ALTER TABLE "public"."audio_features" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tracks" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "spotify_id" character varying(255),
    "itunes_id" character varying(255),
    "title" character varying(500) NOT NULL,
    "artist" character varying(500) NOT NULL,
    "duration_ms" integer,
    "preview_url" "text",
    "artwork_url" "text",
    "genre" character varying(100),
    "release_date" character varying(50),
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."tracks" OWNER TO "postgres";


ALTER TABLE ONLY "public"."analysis_cache"
    ADD CONSTRAINT "analysis_cache_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."analysis_cache"
    ADD CONSTRAINT "analysis_cache_track_id_key" UNIQUE ("track_id");



ALTER TABLE ONLY "public"."audio_features"
    ADD CONSTRAINT "audio_features_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."tracks"
    ADD CONSTRAINT "tracks_itunes_id_key" UNIQUE ("itunes_id");



ALTER TABLE ONLY "public"."tracks"
    ADD CONSTRAINT "tracks_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."tracks"
    ADD CONSTRAINT "tracks_spotify_id_key" UNIQUE ("spotify_id");



CREATE INDEX "idx_analysis_cache_created_at" ON "public"."analysis_cache" USING "btree" ("created_at");



CREATE INDEX "idx_analysis_cache_status" ON "public"."analysis_cache" USING "btree" ("analysis_status");



CREATE INDEX "idx_analysis_cache_track_id" ON "public"."analysis_cache" USING "btree" ("track_id");



CREATE INDEX "idx_audio_features_danceability" ON "public"."audio_features" USING "btree" ("danceability");



CREATE INDEX "idx_audio_features_energy" ON "public"."audio_features" USING "btree" ("energy");



CREATE INDEX "idx_audio_features_tempo" ON "public"."audio_features" USING "btree" ("tempo");



CREATE UNIQUE INDEX "idx_audio_features_track_id" ON "public"."audio_features" USING "btree" ("track_id");



CREATE INDEX "idx_audio_features_valence" ON "public"."audio_features" USING "btree" ("valence");



CREATE INDEX "idx_tracks_created_at" ON "public"."tracks" USING "btree" ("created_at");



CREATE INDEX "idx_tracks_itunes_id" ON "public"."tracks" USING "btree" ("itunes_id");



CREATE INDEX "idx_tracks_spotify_id" ON "public"."tracks" USING "btree" ("spotify_id");



CREATE INDEX "idx_tracks_title_artist" ON "public"."tracks" USING "btree" ("title", "artist");



CREATE OR REPLACE TRIGGER "update_analysis_cache_updated_at" BEFORE UPDATE ON "public"."analysis_cache" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



CREATE OR REPLACE TRIGGER "update_tracks_updated_at" BEFORE UPDATE ON "public"."tracks" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();



ALTER TABLE ONLY "public"."analysis_cache"
    ADD CONSTRAINT "analysis_cache_audio_features_id_fkey" FOREIGN KEY ("audio_features_id") REFERENCES "public"."audio_features"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."analysis_cache"
    ADD CONSTRAINT "analysis_cache_track_id_fkey" FOREIGN KEY ("track_id") REFERENCES "public"."tracks"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."audio_features"
    ADD CONSTRAINT "audio_features_track_id_fkey" FOREIGN KEY ("track_id") REFERENCES "public"."tracks"("id") ON DELETE CASCADE;





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";





GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";































































































































































GRANT ALL ON FUNCTION "public"."update_updated_at"() TO "anon";
GRANT ALL ON FUNCTION "public"."update_updated_at"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."update_updated_at"() TO "service_role";


















GRANT ALL ON TABLE "public"."analysis_cache" TO "anon";
GRANT ALL ON TABLE "public"."analysis_cache" TO "authenticated";
GRANT ALL ON TABLE "public"."analysis_cache" TO "service_role";



GRANT ALL ON TABLE "public"."audio_features" TO "anon";
GRANT ALL ON TABLE "public"."audio_features" TO "authenticated";
GRANT ALL ON TABLE "public"."audio_features" TO "service_role";



GRANT ALL ON TABLE "public"."tracks" TO "anon";
GRANT ALL ON TABLE "public"."tracks" TO "authenticated";
GRANT ALL ON TABLE "public"."tracks" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";






























RESET ALL;
