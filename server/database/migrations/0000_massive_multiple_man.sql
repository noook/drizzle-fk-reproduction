DO $$ BEGIN
 CREATE TYPE "prestation_type" AS ENUM('course', 'multi_year_plan', 'document_validation', 'redesign', 'audit');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "prestation_tags" (
	"prestation_id" uuid NOT NULL,
	"tag_id" text NOT NULL,
	CONSTRAINT "prestation_tag_unique" UNIQUE("prestation_id","tag_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "prestations" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" text NOT NULL,
	"description" text NOT NULL,
	"type" "prestation_type" NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "tags" (
	"id" text PRIMARY KEY NOT NULL,
	"label" text NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "prestation_tags" ADD CONSTRAINT "prestation_tags_prestation_id_prestations_id_fk" FOREIGN KEY ("prestation_id") REFERENCES "prestations"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "prestation_tags" ADD CONSTRAINT "prestation_tags_tag_id_tags_id_fk" FOREIGN KEY ("tag_id") REFERENCES "tags"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
