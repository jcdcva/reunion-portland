import { getDatabase } from "@netlify/database";
import type { Config } from "@netlify/functions";

export default async (req: Request) => {
  const db = getDatabase();
  if (req.method === "POST") {
    const { name, category, url, note, distance } = await req.json();
    if (!name) return new Response("name required", { status: 400 });
    const maxSort = await db.sql`SELECT COALESCE(MAX(sort_order), 0) + 1 AS next FROM places WHERE category = ${category}`;
    const sortOrder = maxSort[0].next;
    await db.sql`INSERT INTO places (name, category, url, note, distance, sort_order)
      VALUES (${name}, ${category}, ${url || null}, ${note || null}, ${distance || null}, ${sortOrder})`;
    return new Response("ok", { status: 201 });
  }

  if (req.method === "DELETE") {
    const u = new URL(req.url);
    const id = u.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    await db.sql`DELETE FROM places WHERE id = ${parseInt(id)}`;
    return new Response("ok");
  }

  return new Response("method not allowed", { status: 405 });
};

export const config: Config = {
  path: "/api/places",
  method: ["POST", "DELETE"],
};
