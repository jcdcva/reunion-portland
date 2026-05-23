import { getDatabase } from "@netlify/database";
import type { Config } from "@netlify/functions";

async function handleGuests(req: Request) {
  const db = getDatabase();
  if (req.method === "POST") {
    const { houseId, name, familyGroup, role, arrival, departure } = await req.json();
    if (!name || !houseId) return new Response("name and houseId required", { status: 400 });
    await db.sql`INSERT INTO guests (house_id, name, family_group, role, arrival, departure)
      VALUES (${houseId}, ${name}, ${familyGroup || name}, ${role || null}, ${arrival || null}, ${departure || null})`;
    return new Response("ok", { status: 201 });
  }

  if (req.method === "DELETE") {
    const url = new URL(req.url);
    const id = url.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    await db.sql`DELETE FROM guests WHERE id = ${parseInt(id)}`;
    return new Response("ok");
  }

  return new Response("method not allowed", { status: 405 });
}

async function handleFamilyDelete(req: Request) {
  const db = getDatabase();
  const url = new URL(req.url);
  const houseId = url.searchParams.get("houseId");
  const group = url.searchParams.get("group");
  if (!houseId || !group) return new Response("houseId and group required", { status: 400 });
  await db.sql`DELETE FROM guests WHERE house_id = ${parseInt(houseId)} AND family_group = ${group}`;
  return new Response("ok");
}

export default async (req: Request) => {
  const url = new URL(req.url);
  if (url.pathname === "/api/guests/family" && req.method === "DELETE") {
    return handleFamilyDelete(req);
  }
  return handleGuests(req);
};

export const config: Config = {
  path: ["/api/guests", "/api/guests/family"],
  method: ["POST", "DELETE"],
};
