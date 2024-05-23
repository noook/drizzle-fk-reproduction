CREATE TABLE IF NOT EXISTS "audit_orders" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"context" text NOT NULL,
	"online_content_resource_id" uuid,
	"offline_content_resource_id" uuid
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "audit_orders" ADD CONSTRAINT "audit_orders_online_content_resource_id_form_resources_id_fk" FOREIGN KEY ("online_content_resource_id") REFERENCES "form_resources"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "audit_orders" ADD CONSTRAINT "audit_orders_offline_content_resource_id_form_resources_id_fk" FOREIGN KEY ("offline_content_resource_id") REFERENCES "form_resources"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
