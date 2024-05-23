import type { Config } from 'drizzle-kit'

export default {
  out: 'server/database/migrations',
  schema: 'server/database/schemas/index.ts',
  dialect: 'postgresql',
  dbCredentials: {
    url: process.env.DATABASE_URL!,
  },
} satisfies Config
