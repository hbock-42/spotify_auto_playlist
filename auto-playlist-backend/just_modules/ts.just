# TypeScript Development Recipes
# ================================


# Check TypeScript types without emitting files
[group('typescript')]
type-check:
    @echo "🔍 Running TypeScript type checking..."
    pnpm type-check

# Run ESLint to check for code issues
[group('typescript')]
lint:
    @echo "🔧 Running ESLint..."
    pnpm lint

# Fix ESLint issues automatically
[group('typescript')]
lint-fix:
    @echo "🔧 Fixing ESLint issues..."
    pnpm lint:fix

# Format code with Prettier
[group('typescript')]
format:
    @echo "💄 Formatting code with Prettier..."
    pnpm format

# Check if code is properly formatted
[group('typescript')]
format-check:
    @echo "💄 Checking code formatting..."
    pnpm format:check

# Run all quality checks (type-check + lint + format-check)
[group('typescript')]
check:
    @echo "✅ Running all quality checks..."
    pnpm check

# Build TypeScript to JavaScript
[group('typescript')]
build:
    @echo "🏗️ Building TypeScript..."
    pnpm build

# Clean build artifacts
[group('typescript')]
clean:
    @echo "🧹 Cleaning build artifacts..."
    rm -rf dist/
    rm -rf *.tsbuildinfo

# Development server with hot reload
[group('typescript')]
dev:
    @echo "🚀 Starting development server..."
    pnpm dev

# Production server
[group('typescript')]
start:
    @echo "🌟 Starting production server..."
    pnpm start

# Generate OpenAPI documentation
[group('typescript')]
openapi:
    @echo "📚 Generating OpenAPI documentation..."
    pnpm generate-openapi

# Full quality check and build pipeline
[group('typescript')]
ci: check build
    @echo "✨ CI pipeline completed successfully!"

# Quick development workflow - format, check, and run
[group('typescript')]
quick: format check dev

# Fix all auto-fixable issues
[group('typescript')]
fix: lint-fix format
    @echo "🔧 Fixed all auto-fixable issues!"