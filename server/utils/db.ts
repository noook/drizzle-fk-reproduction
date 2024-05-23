import type { H3Event } from 'h3'
import type { ConsolaInstance } from 'consola'
import { drizzle, type NodePgDatabase } from 'drizzle-orm/node-postgres'
import type { DrizzleConfig, Logger } from 'drizzle-orm'
import pg from 'pg'
import * as schema from '../database/schemas'
import { useLogger } from '../utils/logger'

let _db: NodePgDatabase<typeof schema> | null = null

export async function createDrizzle<TSchema extends Record<string, unknown> = Record<string, never>>(config: DrizzleConfig<TSchema> = {}) {
  const client = new pg.Client({
    connectionString: import.meta.env.DATABASE_URL,
  })
  client.on('error', async (_err) => {
    _db = await createDrizzle({
      schema,
      logger: config.logger,
    })
  })
  await client.connect()
  return drizzle(client, config)
}

export async function useDatabase(event?: H3Event) {
  const config = useRuntimeConfig(event)
  const logger = useLogger('drizzle')

  if (!_db) {
    _db = await createDrizzle({
      schema,
      logger: config.db.logQueries && new DBLogger(logger),
    })
  }

  return _db
}

class DBLogger implements Logger {
  constructor(private readonly consola: ConsolaInstance) {}

  logQuery(query: string, params: unknown[]): void {
    this.consola.log({ query, params })
  }
}
