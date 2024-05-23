import { sql } from 'drizzle-orm'
import { pgTable, text, uuid } from 'drizzle-orm/pg-core'

export const T_formResources = pgTable('form_resources', {
  id: uuid('id').primaryKey().defaultRandom(),
  urls: text('urls').array().notNull().default(sql`ARRAY[]::text[]`),
  files: text('files').array().notNull().default(sql`ARRAY[]::text[]`),
  accessCode: text('access_code').notNull(),
})
