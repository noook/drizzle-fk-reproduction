import { pgTable, text, uuid } from 'drizzle-orm/pg-core'

export const T_userInfos = pgTable('user_infos', {
  id: uuid('id').primaryKey().defaultRandom(),
  firstName: text('first_name').notNull(),
  lastName: text('last_name').notNull(),
  email: text('email').notNull(),
  role: text('role').notNull(),
})

export const T_companyInfos = pgTable('company_infos', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name').notNull(),
  address: text('address').notNull(),
  siren: text('siren').notNull(),
})
