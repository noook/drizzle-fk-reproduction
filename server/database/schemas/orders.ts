import { pgTable, serial, text, timestamp, uuid } from 'drizzle-orm/pg-core'
import { relations } from 'drizzle-orm'
import { T_companyInfos, T_userInfos } from './userinfo'
import { T_prestations } from './prestations'
import { T_formResources } from './form-resources'

export const T_orders = pgTable('orders', {
  id: serial('id').primaryKey(),
  requesterId: uuid('requester_id').notNull()
    // .references(() => T_userInfos.id, { onDelete: 'cascade' })
  ,
  companyInfoId: uuid('company_info_id')
    // .references(() => T_companyInfos.id, { onDelete: 'set null' })
  ,
  prestationId: uuid('prestation_id').notNull()
    // .references(() => T_prestations.id, { onDelete: 'cascade' })
  ,
  formId: uuid('form_id').notNull(),
  createdAt: timestamp('created_at', { mode: 'string', withTimezone: true }).notNull().defaultNow(),
})

export const R_ordersRelations = relations(T_orders, ({ one }) => ({
  prestation: one(T_prestations, {
    fields: [T_orders.prestationId],
    references: [T_prestations.id],
  }),
  requester: one(T_userInfos, {
    fields: [T_orders.requesterId],
    references: [T_userInfos.id],
  }),
  company: one(T_companyInfos, {
    fields: [T_orders.companyInfoId],
    references: [T_companyInfos.id],
  }),
}))

export const T_courseOrders = pgTable('course_orders', {
  id: uuid('id').primaryKey().defaultRandom(),
  modality: text('modality').notNull(),
  context: text('context').notNull().default(''),
  signatoryId: uuid('signatory_id')
    // .references(() => T_userInfos.id, { onDelete: 'cascade' })
  ,
})

export const R_courseOrdersRelations = relations(T_courseOrders, ({ one }) => ({
  signatory: one(T_userInfos, {
    fields: [T_courseOrders.signatoryId],
    references: [T_userInfos.id],
  }),
}))

export const T_redesignOrders = pgTable('redesign_orders', {
  id: uuid('id').primaryKey().defaultRandom(),
  context: text('context').notNull(),
  specsResourceId: uuid('specs_resource_id').notNull().references(() => T_formResources.id),
  planning: text('planning').notNull().default(''),
})

export const R_redesignOrderRelations = relations(T_redesignOrders, ({ one }) => ({
  specs: one(T_formResources, {
    fields: [T_redesignOrders.specsResourceId],
    references: [T_formResources.id],
  }),
}))

export const T_multiyearPlanOrders = pgTable('multi_year_plan_orders', {
  id: uuid('id').primaryKey().defaultRandom(),
  context: text('context').notNull(),
  ecosystemSize: text('ecosystem_size').notNull(),
  currentPlanResourceId: uuid('current_plan_resource_id').references(() => T_formResources.id),
  planning: text('planning').notNull().default(''),
})

export const R_multiyearPlanRelations = relations(T_multiyearPlanOrders, ({ one }) => ({
  currentPlan: one(T_formResources, {
    fields: [T_multiyearPlanOrders.currentPlanResourceId],
    references: [T_formResources.id],
  }),
}))

export const T_documentValidationOrders = pgTable('document_validation_orders', {
  id: uuid('id').primaryKey().defaultRandom(),
  context: text('context').notNull(),
  documentsResourceId: uuid('documents_resource_id').notNull().references(() => T_formResources.id),
  planning: text('planning').notNull().default(''),
})

export const R_documentValidationRelations = relations(T_documentValidationOrders, ({ one }) => ({
  documents: one(T_formResources, {
    fields: [T_documentValidationOrders.documentsResourceId],
    references: [T_formResources.id],
  }),
}))

export const T_auditOrders = pgTable('audit_orders', {
  id: uuid('id').primaryKey().defaultRandom(),
  context: text('context').notNull(),
  norm: text('norm').notNull(),
  onlineContentResourceId: uuid('online_content_resource_id').notNull().references(() => T_formResources.id),
  offlineContentResourceId: uuid('offline_content_resource_id').notNull().references(() => T_formResources.id),
  planning: text('planning').notNull().default(''),
})

export const R_auditRelations = relations(T_auditOrders, ({ one }) => ({
  onlineContent: one(T_formResources, {
    fields: [T_auditOrders.onlineContentResourceId],
    references: [T_formResources.id],
  }),
  offlineContent: one(T_formResources, {
    fields: [T_auditOrders.offlineContentResourceId],
    references: [T_formResources.id],
  }),
}))
