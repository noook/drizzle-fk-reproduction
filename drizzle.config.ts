import type { Config } from 'drizzle-kit'

export default {
  out: 'server/database/migrations',
  schema: 'server/database/schemas/index.ts',
  driver: 'pg',
  dbCredentials: {
    connectionString: process.env.DATABASE_URL,
  },
} satisfies Config
