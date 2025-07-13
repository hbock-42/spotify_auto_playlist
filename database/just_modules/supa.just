# Start Supabase local development stack (use --debug for troubleshooting: just start --debug)
[group('supabase')]
start *ARGS:
    pnpx supabase start {{ARGS}}

# Start Supabase without analytics/logflare (use if analytics container fails)
[group('supabase')]
start-no-analytics *ARGS:
    pnpx supabase start --exclude logflare {{ARGS}}

# Stop Supabase local development stack
[group('supabase')]
stop:
    pnpx supabase stop

# Generate migration from schema changes (declarative)
[group('supabase')]
auto-migration MIGRATION_NAME:
    pnpx supabase db diff -f '{{ MIGRATION_NAME }}'

# Dump database schema to file
[group('supabase')]
_dump-schema:
    mkdir -p .schemas_dump
    pnpx supabase db dump --local -f .schemas_dump/schema.sql

# Apply pending migrations to local database
[group('supabase')]
migrate-up:
    pnpx supabase migration up
    just _dump-schema

# Rollback last migration from local database
[group('supabase')]
migrate-down:
    pnpx supabase migration down
    just _dump-schema

# Deploy schema changes to remote database
[group('supabase')]
_push:
    pnpx supabase db push

# Reset local database to clean state
[group('supabase')]
reset:
    pnpx supabase db reset

# Show migration status
[group('supabase')]
status:
    pnpx supabase status

# Create new migration file manually
[group('supabase')]
_migration MIGRATION_NAME:
    pnpx supabase migration new {{ MIGRATION_NAME }}

# Open Supabase Studio in browser
[group('supabase')]
studio:
    open http://127.0.0.1:54323

# Generate TypeScript types from database schema
[group('supabase')]
gen-types:
    pnpx supabase gen types typescript --local > types/supabase.ts

# Seed local database
[group('supabase')]
seed:
    pnpx supabase db seed

# Show database logs
[group('supabase')]
logs:
    pnpx supabase logs db
