CREATE TABLE IF NOT EXISTS "document_evaluation_orders" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"context" text NOT NULL,
	"documents_resource_id" uuid
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "document_evaluation_orders" ADD CONSTRAINT "document_evaluation_orders_documents_resource_id_form_resources_id_fk" FOREIGN KEY ("documents_resource_id") REFERENCES "form_resources"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
