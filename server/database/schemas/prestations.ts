import { relations } from 'drizzle-orm'
import { pgEnum, pgTable, primaryKey, text, uuid } from 'drizzle-orm/pg-core'
import { PrestationType } from '../../../types'

export const E_prestationType = pgEnum('prestation_type', [
  PrestationType.Course,
  PrestationType.MultiYearPlan,
  PrestationType.DocumentValidation,
  PrestationType.Redesign,
  PrestationType.Audit,
])

export const T_prestations = pgTable('prestations', {
  id: uuid('id').primaryKey().defaultRandom(),
  title: text('title').notNull(),
  description: text('description').notNull(),
  externalLink: text('external_link'),
  type: E_prestationType('type').notNull(),
})

export const R_prestationRelation = relations(T_prestations, ({ many }) => ({
  tags: many(T_prestationTags),
}))

export const T_tags = pgTable('tags', {
  id: text('id').primaryKey(),
  label: text('label').notNull(),
})

export const T_prestationTags = pgTable('prestation_tags', {
  prestationId: uuid('prestation_id')
    .notNull()
    .references(() => T_prestations.id, { onDelete: 'cascade' }),
  tagId: text('tag_id')
    .notNull()
    .references(() => T_tags.id, { onDelete: 'cascade' }),
}, table => ({
  pk: primaryKey({ columns: [table.prestationId, table.tagId] }),
}))

export const R_prestionTagsRelations = relations(T_prestationTags, ({ one }) => ({
  prestation: one(T_prestations, {
    fields: [T_prestationTags.prestationId],
    references: [T_prestations.id],
  }),
  tag: one(T_tags, {
    fields: [T_prestationTags.tagId],
    references: [T_tags.id],
  }),
}))
