CREATE TABLE "arrivals" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"flight_number" text,
	"airline" text,
	"arrival_date" text NOT NULL,
	"arrival_time" text,
	"airport" text DEFAULT 'PDX' NOT NULL,
	"note" text,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "departures" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"flight_number" text,
	"airline" text,
	"departure_date" text NOT NULL,
	"departure_time" text,
	"airport" text DEFAULT 'PDX' NOT NULL,
	"note" text,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "carpools" (
	"id" serial PRIMARY KEY,
	"driver_name" text NOT NULL,
	"car_description" text,
	"seats_available" integer DEFAULT 4 NOT NULL,
	"direction" text DEFAULT 'pickup' NOT NULL,
	"date" text NOT NULL,
	"time" text,
	"airport" text DEFAULT 'PDX' NOT NULL,
	"note" text,
	"created_at" timestamp DEFAULT now()
);
