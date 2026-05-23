CREATE TABLE "events" (
	"id" serial PRIMARY KEY,
	"title" text NOT NULL,
	"day" text NOT NULL,
	"time" text DEFAULT 'TBD' NOT NULL,
	"location" text,
	"note" text,
	"author" text,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "guests" (
	"id" serial PRIMARY KEY,
	"house_id" integer NOT NULL,
	"family_group" text,
	"name" text NOT NULL,
	"role" text,
	"arrival" text,
	"departure" text,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "houses" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"emoji" text DEFAULT '🏠' NOT NULL,
	"address" text,
	"capacity" text,
	"note" text,
	"wifi" text,
	"door_code" text,
	"color" text DEFAULT '#2D4A3E' NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "places" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"category" text NOT NULL,
	"url" text,
	"note" text,
	"distance" text,
	"address" text,
	"difficulty" text,
	"length" text,
	"guide_note" text,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "tips_categories" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "tips_items" (
	"id" serial PRIMARY KEY,
	"category_id" integer NOT NULL,
	"text" text NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
ALTER TABLE "guests" ADD CONSTRAINT "guests_house_id_houses_id_fkey" FOREIGN KEY ("house_id") REFERENCES "houses"("id") ON DELETE CASCADE;--> statement-breakpoint
ALTER TABLE "tips_items" ADD CONSTRAINT "tips_items_category_id_tips_categories_id_fkey" FOREIGN KEY ("category_id") REFERENCES "tips_categories"("id") ON DELETE CASCADE;