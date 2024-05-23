ALTER TABLE "audit_orders" ADD COLUMN "planning" text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE "document_validation_orders" ADD COLUMN "planning" text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE "multi_year_plan_orders" ADD COLUMN "planning" text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE "redesign_orders" ADD COLUMN "planning" text DEFAULT '' NOT NULL;