ALTER TABLE "course_orders" DROP CONSTRAINT "course_orders_signatory_id_user_infos_id_fk";
--> statement-breakpoint
ALTER TABLE "orders" DROP CONSTRAINT "orders_requester_id_user_infos_id_fk";
--> statement-breakpoint
ALTER TABLE "prestation_tags" DROP CONSTRAINT "prestation_tags_prestation_id_prestations_id_fk";
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "course_orders" ADD CONSTRAINT "course_orders_signatory_id_user_infos_id_fk" FOREIGN KEY ("signatory_id") REFERENCES "user_infos"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "orders" ADD CONSTRAINT "orders_requester_id_user_infos_id_fk" FOREIGN KEY ("requester_id") REFERENCES "user_infos"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "prestation_tags" ADD CONSTRAINT "prestation_tags_prestation_id_prestations_id_fk" FOREIGN KEY ("prestation_id") REFERENCES "prestations"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
