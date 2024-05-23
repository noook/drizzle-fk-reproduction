CREATE TABLE IF NOT EXISTS "form_resources" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"urls" text[] DEFAULT ARRAY[]::text[],
	"files" text[] DEFAULT ARRAY[]::text[],
	"access_code" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "redesign_orders" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"context" text,
	"specs_resource_id" uuid
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "redesign_orders" ADD CONSTRAINT "redesign_orders_specs_resource_id_form_resources_id_fk" FOREIGN KEY ("specs_resource_id") REFERENCES "form_resources"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
