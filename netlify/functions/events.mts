import { getDatabase } from "@netlify/database";
import type { Config } from "@netlify/functions";

export default async (req: Request) => {
  const db = getDatabase();
  if (req.method === "POST") {
    const { title, day, time, location, note, author } = await req.json();
    if (!title) return new Response("title required", { status: 400 });
    await db.sql`INSERT INTO events (title, day, time, location, note, author)
      VALUES (${title}, ${day}, ${time || 'TBD'}, ${location || null}, ${note || null}, ${author || null})`;
    return new Response("ok", { status: 201 });
  }

  if (req.method === "DELETE") {
    const url = new URL(req.url);
    const id = url.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    await db.sql`DELETE FROM events WHERE id = ${parseInt(id)}`;
    return new Response("ok");
  }

  return new Response("method not allowed", { status: 405 });
};

export const config: Config = {
  path: "/api/events",
  method: ["POST", "DELETE"],
};
