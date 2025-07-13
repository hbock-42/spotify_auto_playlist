# Table of content

<!--ts-->
* [Table of content](#table-of-content)
* [CLAUDE.md](#claudemd)
   * [Project Overview](#project-overview)
   * [Architecture](#architecture)
   * [Development Commands](#development-commands)
      * [Starting the Development Environment](#starting-the-development-environment)
      * [Schema Management (Declarative)](#schema-management-declarative)
      * [Just Commands](#just-commands)
      * [Supabase Local Development](#supabase-local-development)
   * [Key Configuration Details](#key-configuration-details)
      * [Database Schema](#database-schema)
      * [Authentication](#authentication)
      * [File Structure](#file-structure)
   * [Development Workflow](#development-workflow)
      * [Database Schema Development (Declarative Approach)](#database-schema-development-declarative-approach)
      * [Daily Development](#daily-development)
   * [Schema Management Best Practices](#schema-management-best-practices)
   * [Important Notes](#important-notes)
   * [Claude Code Working Principles](#claude-code-working-principles)
   * [Development Guidelines](#development-guidelines)
<!--te-->

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the database component of an auto-playlist project, built as a Supabase-based backend service. The project uses a monorepo structure with pnpm workspaces and Just as the task runner.

## Architecture

- **Database**: Supabase (PostgreSQL with real-time capabilities)
- **Package Manager**: pnpm with workspace configuration
- **Task Runner**: Just (justfile-based command runner)
- **Configuration**: Supabase config.toml for local development setup

## Development Commands

### Starting the Development Environment
```bash
just start              # Start Supabase local development stack
# OR
pnpx supabase start     # Direct command to start Supabase
```

### Schema Management (Declarative)
```bash
just auto-migration MIGRATION_NAME  # Generate migration from schema changes
just migrate-up         # Apply pending migrations locally
just migrate-down       # Rollback last migration
just push               # Deploy schema changes to remote
just reset              # Reset local database to clean state
just status             # Show migration status
```

### Just Commands
```bash
just                    # List all available recipes
just choose             # Interactive recipe selection (alias: just c)
just list-recipe        # List all recipes
just summarize          # Show recipe summary
just fmt                # Format justfile (unstable feature)
```

### Supabase Local Development
- **API Port**: 54321 (http://127.0.0.1:54321)
- **Database Port**: 54322
- **Studio Port**: 54323 (Supabase Studio UI)
- **Inbucket Port**: 54324 (Email testing)

## Key Configuration Details

### Database Schema
- Uses PostgreSQL 17
- Exposed schemas: `public`, `graphql_public`
- Max rows per query: 1000
- Seed file: `./seed.sql` (enabled for db reset)

### Authentication
- JWT expiry: 1 hour (3600 seconds)
- Site URL: http://127.0.0.1:3000
- Email confirmations: disabled
- User signups: enabled
- Password minimum length: 6 characters

### File Structure
```
database/
├── justfile                 # Main task runner configuration
├── just_modules/           # Modular just recipes
│   ├── supa.just          # Supabase-specific commands
│   ├── ccusage.just       # Claude Code usage monitoring
│   └── table_of_content.just  # TOC generation utilities
├── supabase/              # Supabase configuration
│   ├── config.toml        # Local development configuration
│   ├── schemas/           # Declarative schema files (SQL)
│   ├── migrations/        # Generated migration files
│   └── seed.sql          # Database seed data
├── package.json           # Node.js dependencies (supabase CLI)
└── pnpm-workspace.yaml    # Workspace configuration
```

## Development Workflow

### Database Schema Development (Declarative Approach)
1. **Define Schema**: Create/edit SQL files in `supabase/schemas/` to declare your desired database state
2. **Generate Migration**: Run `just auto-migration MIGRATION_NAME` to generate migration files from schema changes
3. **Apply Locally**: Run `just migrate-up` to apply migrations to local database
4. **Test Changes**: Verify schema changes work as expected
5. **Deploy**: Run `just push` to deploy changes to remote database

### Daily Development
1. **Setup**: Run `just start` to initialize the local Supabase stack
2. **Database Access**: Connect to PostgreSQL at localhost:54322
3. **API Testing**: Use the API at http://127.0.0.1:54321
4. **UI Management**: Access Supabase Studio at http://127.0.0.1:54323
5. **Email Testing**: View emails at http://127.0.0.1:54324

## Schema Management Best Practices

- **Declarative Schemas**: Define database structure in `supabase/schemas/*.sql` files
- **Review Migrations**: Always review generated migrations before applying
- **Column Ordering**: Append new columns to the end of tables for better diff generation
- **Complex Changes**: Use traditional versioned migrations for complex changes not supported by declarative schemas
- **Testing**: Test schema changes locally before deploying to remote

## Important Notes

- Uses **declarative database schemas** for simplified schema management
- Migration files are auto-generated from schema declarations
- Traditional migrations still available for complex database changes
- Schema files should declare the desired end state, not the changes
- Part of a larger monorepo structure with pnpm workspace support

## Claude Code Working Principles

- **Task Execution Strategy**: 
  - When you are about to do a big task, use sequential-thinking mcp

## Development Guidelines

- **Always verify library documentation**: Use context7 MCP to check the latest documentation for any library before implementation
