import { getDatabase } from "@netlify/database";
import type { Config } from "@netlify/functions";

export default async (req: Request) => {
  const db = getDatabase();
  if (req.method === "POST") {
    const { name, address, capacity, note, wifi, doorCode, color } = await req.json();
    if (!name) return new Response("name required", { status: 400 });
    const maxSort = await db.sql`SELECT COALESCE(MAX(sort_order), 0) + 1 AS next FROM houses`;
    const sortOrder = maxSort[0].next;
    await db.sql`INSERT INTO houses (name, address, capacity, note, wifi, door_code, color, emoji, sort_order)
      VALUES (${name}, ${address || null}, ${capacity || null}, ${note || null}, ${wifi || null}, ${doorCode || null}, ${color || '#333333'}, ${'🏠'}, ${sortOrder})`;
    return new Response("ok", { status: 201 });
  }

  if (req.method === "PUT") {
    const { id, wifi, doorCode } = await req.json();
    if (!id) return new Response("id required", { status: 400 });
    await db.sql`UPDATE houses SET wifi = ${wifi || null}, door_code = ${doorCode || null} WHERE id = ${parseInt(id)}`;
    return new Response("ok");
  }

  if (req.method === "DELETE") {
    const url = new URL(req.url);
    const id = url.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    await db.sql`DELETE FROM houses WHERE id = ${parseInt(id)}`;
    return new Response("ok");
  }

  return new Response("method not allowed", { status: 405 });
};

export const config: Config = {
  path: "/api/houses",
  method: ["POST", "PUT", "DELETE"],
};
