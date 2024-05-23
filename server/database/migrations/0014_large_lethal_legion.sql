ALTER TABLE "orders" ADD COLUMN "company_info_id" uuid;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "orders" ADD CONSTRAINT "orders_company_info_id_company_infos_id_fk" FOREIGN KEY ("company_info_id") REFERENCES "company_infos"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
