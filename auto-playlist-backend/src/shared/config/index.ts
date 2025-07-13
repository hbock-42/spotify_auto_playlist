import { Config } from 'effect'

// Database configuration
export const dbConfig = Config.all({
  host: Config.string('DB_HOST').pipe(Config.withDefault('localhost')),
  port: Config.integer('DB_PORT').pipe(Config.withDefault(5432)),
  database: Config.string('DB_NAME').pipe(Config.withDefault('auto_playlist')),
  username: Config.string('DB_USER').pipe(Config.withDefault('postgres')),
  password: Config.string('DB_PASSWORD'),
  ssl: Config.boolean('DB_SSL').pipe(Config.withDefault(false)),
})

// Server configuration
export const serverConfig = Config.all({
  port: Config.integer('PORT').pipe(Config.withDefault(3000)),
  host: Config.string('HOST').pipe(Config.withDefault('0.0.0.0')),
  nodeEnv: Config.string('NODE_ENV').pipe(Config.withDefault('development')),
})

// iTunes API configuration
export const itunesConfig = Config.all({
  baseUrl: Config.string('ITUNES_API_URL').pipe(
    Config.withDefault('https://itunes.apple.com/search')
  ),
  rateLimitPerMinute: Config.integer('ITUNES_RATE_LIMIT').pipe(
    Config.withDefault(20)
  ),
  timeout: Config.integer('ITUNES_TIMEOUT_MS').pipe(Config.withDefault(5000)),
})

// Audio analysis configuration
export const audioConfig = Config.all({
  tempDir: Config.string('AUDIO_TEMP_DIR').pipe(
    Config.withDefault('/tmp/audio')
  ),
  maxFileSize: Config.integer('MAX_AUDIO_FILE_SIZE').pipe(
    Config.withDefault(10 * 1024 * 1024)
  ), // 10MB
  analysisTimeout: Config.integer('ANALYSIS_TIMEOUT_MS').pipe(
    Config.withDefault(30000)
  ),
  frameSize: Config.integer('AUDIO_FRAME_SIZE').pipe(Config.withDefault(1024)),
  hopSize: Config.integer('AUDIO_HOP_SIZE').pipe(Config.withDefault(512)),
  concurrency: Config.integer('AUDIO_ANALYSIS_CONCURRENCY').pipe(
    Config.withDefault(3)
  ),
})

// Combined application configuration
export const appConfig = Config.all({
  server: serverConfig,
  database: dbConfig,
  itunes: itunesConfig,
  audio: audioConfig,
})

export type AppConfig = Config.Config.Success<typeof appConfig>
