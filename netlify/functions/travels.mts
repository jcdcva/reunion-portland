import { getDatabase } from "@netlify/database";
import type { Config } from "@netlify/functions";

async function handleArrivals(req: Request) {
  const db = getDatabase();
  if (req.method === "POST") {
    const { name, flightNumber, airline, arrivalDate, arrivalTime, airport, note } = await req.json();
    if (!name || !arrivalDate) return new Response("name and arrivalDate required", { status: 400 });
    try {
      await db.sql`INSERT INTO arrivals (name, flight_number, airline, arrival_date, arrival_time, airport, note)
        VALUES (${name}, ${flightNumber || null}, ${airline || null}, ${arrivalDate}, ${arrivalTime || null}, ${airport || 'PDX'}, ${note || null})`;
      return new Response("ok", { status: 201 });
    } catch (err: any) {
      const underlying = err?.cause || err;
      console.error("INSERT arrivals error:", underlying);
      return Response.json(
        { error: underlying?.message || String(underlying), code: underlying?.code || null },
        { status: 500 },
      );
    }
  }

  if (req.method === "DELETE") {
    const url = new URL(req.url);
    const id = url.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    try {
      await db.sql`DELETE FROM arrivals WHERE id = ${parseInt(id)}`;
      return new Response("ok");
    } catch (err: any) {
      const underlying = err?.cause || err;
      console.error("DELETE arrivals error:", underlying);
      return Response.json(
        { error: underlying?.message || String(underlying), code: underlying?.code || null },
        { status: 500 },
      );
    }
  }

  return new Response("method not allowed", { status: 405 });
}

async function handleDepartures(req: Request) {
  const db = getDatabase();
  if (req.method === "POST") {
    const { name, flightNumber, airline, departureDate, departureTime, airport, note } = await req.json();
    if (!name || !departureDate) return new Response("name and departureDate required", { status: 400 });
    try {
      await db.sql`INSERT INTO departures (name, flight_number, airline, departure_date, departure_time, airport, note)
        VALUES (${name}, ${flightNumber || null}, ${airline || null}, ${departureDate}, ${departureTime || null}, ${airport || 'PDX'}, ${note || null})`;
      return new Response("ok", { status: 201 });
    } catch (err: any) {
      const underlying = err?.cause || err;
      console.error("INSERT departures error:", underlying);
      return Response.json(
        { error: underlying?.message || String(underlying), code: underlying?.code || null },
        { status: 500 },
      );
    }
  }

  if (req.method === "DELETE") {
    const url = new URL(req.url);
    const id = url.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    try {
      await db.sql`DELETE FROM departures WHERE id = ${parseInt(id)}`;
      return new Response("ok");
    } catch (err: any) {
      const underlying = err?.cause || err;
      console.error("DELETE departures error:", underlying);
      return Response.json(
        { error: underlying?.message || String(underlying), code: underlying?.code || null },
        { status: 500 },
      );
    }
  }

  return new Response("method not allowed", { status: 405 });
}

async function handleCarpools(req: Request) {
  const db = getDatabase();
  if (req.method === "POST") {
    const { driverName, carDescription, seatsAvailable, direction, date, time, airport, note } = await req.json();
    if (!driverName || !date) return new Response("driverName and date required", { status: 400 });
    try {
      await db.sql`INSERT INTO carpools (driver_name, car_description, seats_available, direction, date, time, airport, note)
        VALUES (${driverName}, ${carDescription || null}, ${seatsAvailable || 4}, ${direction || 'pickup'}, ${date}, ${time || null}, ${airport || 'PDX'}, ${note || null})`;
      return new Response("ok", { status: 201 });
    } catch (err: any) {
      const underlying = err?.cause || err;
      console.error("INSERT carpools error:", underlying);
      return Response.json(
        { error: underlying?.message || String(underlying), code: underlying?.code || null },
        { status: 500 },
      );
    }
  }

  if (req.method === "DELETE") {
    const url = new URL(req.url);
    const id = url.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    try {
      await db.sql`DELETE FROM carpools WHERE id = ${parseInt(id)}`;
      return new Response("ok");
    } catch (err: any) {
      const underlying = err?.cause || err;
      console.error("DELETE carpools error:", underlying);
      return Response.json(
        { error: underlying?.message || String(underlying), code: underlying?.code || null },
        { status: 500 },
      );
    }
  }

  return new Response("method not allowed", { status: 405 });
}

export default async (req: Request) => {
  const url = new URL(req.url);
  if (url.pathname === "/api/travels/arrivals") return handleArrivals(req);
  if (url.pathname === "/api/travels/departures") return handleDepartures(req);
  if (url.pathname === "/api/travels/carpools") return handleCarpools(req);
  return new Response("not found", { status: 404 });
};

export const config: Config = {
  path: "/api/travels/*",
  method: ["POST", "DELETE"],
};
