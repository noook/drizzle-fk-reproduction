ALTER TABLE "course_orders" RENAME COLUMN "signatory" TO "signatory_id";--> statement-breakpoint
ALTER TABLE "course_orders" DROP CONSTRAINT "course_orders_signatory_user_infos_id_fk";
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "course_orders" ADD CONSTRAINT "course_orders_signatory_id_user_infos_id_fk" FOREIGN KEY ("signatory_id") REFERENCES "user_infos"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
