CREATE TABLE IF NOT EXISTS "multi_year_plan_orders" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"context" text NOT NULL,
	"ecosystem_size" text NOT NULL,
	"current_plan_resource_id" uuid
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "multi_year_plan_orders" ADD CONSTRAINT "multi_year_plan_orders_current_plan_resource_id_form_resources_id_fk" FOREIGN KEY ("current_plan_resource_id") REFERENCES "form_resources"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
