ALTER TABLE "form_resources" ALTER COLUMN "urls" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "form_resources" ALTER COLUMN "files" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "audit_orders" ALTER COLUMN "online_content_resource_id" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "audit_orders" ALTER COLUMN "offline_content_resource_id" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "document_validation_orders" ALTER COLUMN "documents_resource_id" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "redesign_orders" ALTER COLUMN "specs_resource_id" SET NOT NULL;