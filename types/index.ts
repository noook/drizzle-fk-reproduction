import type { T_auditOrders, T_courseOrders, T_documentValidationOrders, T_multiyearPlanOrders, T_formResources, T_orders, T_prestations, T_redesignOrders, T_tags, T_userInfos, T_companyInfos } from '~/server/database/schemas'

export enum PrestationType {
  Course = 'course',
  MultiYearPlan = 'multi_year_plan',
  DocumentValidation = 'document_validation',
  Redesign = 'redesign',
  Audit = 'audit',
}

export type UserInfo = typeof T_userInfos.$inferSelect
export type CompanyInfo = typeof T_companyInfos.$inferSelect

export type Tag = typeof T_tags.$inferSelect

export type Prestation = typeof T_prestations.$inferSelect
export type PrestationDetail = Prestation & {
  tags: Tag[]
}

export type Order = typeof T_orders.$inferSelect

export type CourseOrder = typeof T_courseOrders.$inferSelect & {
  signatory: null | UserInfo
}
export type RedesignOrder = typeof T_redesignOrders.$inferSelect & {
  specs: FormResource
}
export type MultiYearPlanOrder = typeof T_multiyearPlanOrders.$inferSelect & {
  currentPlan: null | FormResource
}
export type DocumentValidationOrder = typeof T_documentValidationOrders.$inferSelect & {
  documents: FormResource
}
export type AuditOrder = typeof T_auditOrders.$inferSelect & {
  offlineContent: FormResource
  onlineContent: FormResource
}
export type OrderData = CourseOrder | RedesignOrder | MultiYearPlanOrder | DocumentValidationOrder | AuditOrder

export type FormResource = typeof T_formResources.$inferSelect

export type OrderRow = Order & {
  prestation: Prestation
  requester: UserInfo
  company: null | CompanyInfo
}
