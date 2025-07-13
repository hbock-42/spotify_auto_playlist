# SQL Type Generation Recipes
# ===========================

# Schema file location (managed by database project)
SCHEMA_PATH := "../database/.schemas_dump/schema.sql"

# Generate TypeScript types from SQL queries using sqlc
[group('sql')]
generate-types:
    @echo "🔧 Generating TypeScript types from SQL..."
    @if [ ! -f {{SCHEMA_PATH}} ]; then \
        echo "❌ Schema file not found at {{SCHEMA_PATH}}"; \
        echo "💡 Run migrations in the database project first"; \
        exit 1; \
    fi
    @echo "✅ Schema file found, generating types..."
    @sqlc generate
    @echo "✅ TypeScript types generated!"

# Clean generated SQL TypeScript files
[group('sql')]
clean-types:
    @echo "🧹 Cleaning generated TypeScript files..."
    @rm -rf src/generated/sqlc/*
    @echo "✅ Generated types cleaned!"

# Check if schema file exists and show info
[group('sql')]
schema-status:
    @if [ -f {{SCHEMA_PATH}} ]; then \
        echo "✅ Schema file exists: {{SCHEMA_PATH}}"; \
        echo "📊 Tables found: $(grep -c "CREATE TABLE" {{SCHEMA_PATH}} 2>/dev/null || echo "0")"; \
        echo "📈 Schema file size: $(wc -l < {{SCHEMA_PATH}} 2>/dev/null || echo "0") lines"; \
        echo "🕐 Last modified: $(stat -f %Sm {{SCHEMA_PATH}} 2>/dev/null || stat -c %y {{SCHEMA_PATH}} 2>/dev/null || echo "unknown")"; \
    else \
        echo "❌ Schema file not found: {{SCHEMA_PATH}}"; \
        echo "💡 Make sure to run migrations in the database project"; \
        echo "💡 The database project should generate the schema automatically"; \
    fi

# Show help
[group('sql')]
sql-help:
    @echo "🗃️  SQL Type Generation Workflow:"
    @echo ""
    @echo "   📊 schema-status    - Check schema file status"
    @echo "   🔧 generate-types   - Generate TypeScript from SQL queries"
    @echo "   🧹 clean-types      - Clean generated TypeScript files"
    @echo ""
    @echo "🔄 Workflow:"
    @echo "   1. Run migrations in database project (generates {{SCHEMA_PATH}})"
    @echo "   2. Run 'just generate-types' to create TypeScript types"
    @echo ""
    @echo "💡 After modifying SQL queries: just generate-types"
    @echo "💡 After database migrations: database project auto-updates schema"
    @echo ""
    @echo "🔧 Requirements:"
    @echo "   - sqlc installed for TypeScript generation"
    @echo "   - Schema file at {{SCHEMA_PATH}} (managed by database project)"

# IMPORTANT: Reminder rule for TypeScript operations
[group('sql')]
remind-sql-gen:
    @echo "💡 REMINDER: If you modified SQL queries:"
    @echo "   Run 'just generate-types' to regenerate TypeScript types"
    @echo "   Schema updates are handled automatically by the database project"