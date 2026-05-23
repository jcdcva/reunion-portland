import { getDatabase } from "@netlify/database";
import type { Config } from "@netlify/functions";

export default async (req: Request) => {
  const db = getDatabase();
  const [houses, guests, events, places, tipsCategories, tipsItems, arrivals, departures, carpools, welcomeRows] = await Promise.all([
    db.sql`SELECT id, name, address, capacity, note, wifi, door_code AS "doorCode", color, emoji, url FROM houses ORDER BY sort_order`,
    db.sql`SELECT id, name, house_id AS "houseId", family_group AS "familyGroup", role, arrival, departure FROM guests ORDER BY id`,
    db.sql`SELECT id, title, day, time, location, note, author FROM events ORDER BY id`,
    db.sql`SELECT id, name, category, url, note, address, distance, difficulty, length, guide_note AS "guideNote", cuisine FROM places ORDER BY sort_order, id`,
    db.sql`SELECT id, name FROM tips_categories ORDER BY sort_order`,
    db.sql`SELECT id, category_id AS "categoryId", text FROM tips_items ORDER BY sort_order`,
    db.sql`SELECT id, name, flight_number AS "flightNumber", airline, arrival_date AS "arrivalDate", arrival_time AS "arrivalTime", airport, note FROM arrivals ORDER BY arrival_date, arrival_time, id`,
    db.sql`SELECT id, name, flight_number AS "flightNumber", airline, departure_date AS "departureDate", departure_time AS "departureTime", airport, note FROM departures ORDER BY departure_date, departure_time, id`,
    db.sql`SELECT id, driver_name AS "driverName", car_description AS "carDescription", seats_available AS "seatsAvailable", direction, date, time, airport, note FROM carpools ORDER BY date, time, id`,
    db.sql`SELECT content FROM welcome_message WHERE id = 1`,
  ]);

  return Response.json({
    houses,
    guests,
    events,
    places,
    tipsCategories,
    tipsItems,
    arrivals,
    departures,
    carpools,
    welcomeMessage: welcomeRows[0]?.content || '',
  });
};

export const config: Config = {
  path: "/api/sync",
};
