# Table of content

<!--ts-->
* [Table of content](#table-of-content)
* [Auto Playlist Database](#auto-playlist-database)
   * [Quick Start](#quick-start)
   * [Development](#development)
      * [Prerequisites](#prerequisites)
      * [Available Commands](#available-commands)
      * [Database Access](#database-access)
      * [API Usage](#api-usage)
   * [Configuration](#configuration)
   * [Schema Management](#schema-management)
      * [Workflow](#workflow)
      * [Key Benefits](#key-benefits)
   * [Project Structure](#project-structure)
   * [Part of Auto Playlist Monorepo](#part-of-auto-playlist-monorepo)
<!--te-->

# Auto Playlist Database

Database backend for the auto-playlist project built with Supabase.

## Quick Start

Start the local development environment:

```bash
just start
```

If the analytics container fails to start, use:

```bash
just start-no-analytics
```

This will spin up the Supabase stack locally with the following services:

- **Database**: localhost:54342 (PostgreSQL)
- **Studio UI**: http://127.0.0.1:54343
- **Email Testing**: http://127.0.0.1:54344
- **Analytics**: http://127.0.0.1:54347 (may fail on some systems)
- **API**: Disabled (can be enabled in config.toml if needed)

**Note**: The analytics container may fail due to Docker socket mounting issues. This doesn't affect core database functionality.

## Development

### Prerequisites

- Node.js
- pnpm
- Just task runner

### Available Commands

```bash
# Development environment
just start          # Start Supabase local stack

# Schema management (declarative)
just auto-migration # Generate migration from schema changes
just migrate-up     # Apply pending migrations locally
just migrate-down   # Rollback last migration
just push           # Deploy schema changes to remote
just reset          # Reset local database to clean state
just status         # Show migration status

# Utility commands
just                # List all available commands
just choose         # Interactive command selection
```

### Database Access

Connect to the local PostgreSQL database:
- **Host**: localhost
- **Port**: 54342
- **Database**: postgres
- **User**: postgres
- **Password**: postgres

### API Usage

The Supabase API is currently **disabled** in the local configuration. To enable it:
1. Edit `supabase/config.toml`
2. Set `[api] enabled = true`
3. Restart the Supabase stack with `just start`

When enabled, the API will be available at `http://127.0.0.1:54341`.

## Configuration

The project uses custom Supabase configuration in `supabase/config.toml` for local development. Key settings:

- **Project ID**: auto_playlist
- **PostgreSQL 17**
- **API**: Disabled by default
- **Custom Ports**: 543xx range to avoid conflicts
- **Declarative Schemas**: Enabled with `./schemas/*.sql` pattern
- **Max query rows**: 1000
- **Realtime**: Disabled

## Schema Management

This project uses **declarative database schemas** for simplified database management:

### Workflow

1. **Define Schema**: Create/edit SQL files in `supabase/schemas/` to declare your desired database state
2. **Generate Migration**: Run `just diff` to generate migration files from schema changes  
3. **Apply Locally**: Run `just migrate-up` to apply migrations to local database
4. **Test Changes**: Verify schema changes work as expected
5. **Deploy**: Run `just push` to deploy changes to remote database

### Key Benefits

- Declare the desired end state instead of writing migration steps
- Automatic migration generation from schema differences
- Simplified collaboration and schema synchronization
- Traditional migrations still available for complex changes

## Project Structure

```
database/
├── justfile              # Task runner commands
├── just_modules/         # Modular command definitions
├── supabase/            # Supabase configuration
│   ├── config.toml      # Local development config
│   ├── schemas/         # Declarative schema files (SQL)
│   ├── migrations/      # Generated migration files
│   └── seed.sql        # Database seed data
└── package.json         # Dependencies
```

## Part of Auto Playlist Monorepo

This database component is part of a larger auto-playlist project organized as a monorepo.
