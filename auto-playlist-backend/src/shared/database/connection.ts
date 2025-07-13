import { Pool, PoolClient } from 'pg'
import { Context, Effect, Layer } from 'effect'
import { dbConfig } from '../config'

// Database service interface using standard pg client
export interface DatabaseService {
  readonly pool: Pool
  readonly getClient: () => Effect.Effect<PoolClient, Error>
}

// Create a tag for the service
export const DatabaseService = Context.GenericTag<DatabaseService>(
  '@auto-playlist/DatabaseService'
)

// PostgreSQL connection pool for Supabase
export const PgLive = Layer.effect(
  DatabaseService,
  Effect.gen(function* () {
    const config = yield* dbConfig
    
    const pool = new Pool({
      host: config.host,
      port: config.port,
      database: config.database,
      user: config.username,
      password: config.password,
      ssl: config.ssl ? { rejectUnauthorized: false } : false,
      max: 20,
      idleTimeoutMillis: 30000,
      connectionTimeoutMillis: 2000,
    })

    const getClient = () => Effect.tryPromise({
      try: () => pool.connect(),
      catch: (error) => new Error(`Database connection failed: ${String(error)}`)
    })

    return { pool, getClient } satisfies DatabaseService
  })
)

// Database service implementation
export const DatabaseServiceLive = PgLive
