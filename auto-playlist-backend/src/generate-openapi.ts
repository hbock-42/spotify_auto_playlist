import 'dotenv/config'
import { generateOpenApiDocument } from 'trpc-openapi'
import { writeFileSync } from 'fs'
import { appRouter } from './shared/http/router'

// Generate OpenAPI document
const openApiDocument = generateOpenApiDocument(appRouter, {
  title: 'Auto Playlist Backend API',
  description:
    'Backend service for auto-playlist Flutter application providing audio analysis capabilities',
  version: '1.0.0',
  baseUrl: 'http://localhost:3000/api',
  tags: ['System', 'Audio Analysis', 'iTunes Search', 'Track Management'],
})

// Write to file
writeFileSync('./openapi.json', JSON.stringify(openApiDocument, null, 2))
console.log('📄 OpenAPI document generated: openapi.json')
