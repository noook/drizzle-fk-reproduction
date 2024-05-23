CREATE TABLE IF NOT EXISTS "course_orders" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"modality" text NOT NULL,
	"signatory" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "orders" (
	"id" serial PRIMARY KEY NOT NULL,
	"requester_id" uuid NOT NULL,
	"prestation_id" uuid NOT NULL,
	"form_id" uuid NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "company_infos" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"address" text NOT NULL,
	"siren" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_infos" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text NOT NULL,
	"email" text NOT NULL,
	"role" text NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "course_orders" ADD CONSTRAINT "course_orders_signatory_user_infos_id_fk" FOREIGN KEY ("signatory") REFERENCES "user_infos"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "orders" ADD CONSTRAINT "orders_requester_id_user_infos_id_fk" FOREIGN KEY ("requester_id") REFERENCES "user_infos"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "orders" ADD CONSTRAINT "orders_prestation_id_prestations_id_fk" FOREIGN KEY ("prestation_id") REFERENCES "prestations"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
