import { getDatabase } from "@netlify/database";
import type { Config } from "@netlify/functions";

async function handleCategories(req: Request) {
  const db = getDatabase();
  if (req.method === "POST") {
    const { name } = await req.json();
    if (!name) return new Response("name required", { status: 400 });
    const maxSort = await db.sql`SELECT COALESCE(MAX(sort_order), 0) + 1 AS next FROM tips_categories`;
    const sortOrder = maxSort[0].next;
    await db.sql`INSERT INTO tips_categories (name, sort_order) VALUES (${name}, ${sortOrder})`;
    return new Response("ok", { status: 201 });
  }

  if (req.method === "DELETE") {
    const url = new URL(req.url);
    const id = url.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    await db.sql`DELETE FROM tips_categories WHERE id = ${parseInt(id)}`;
    return new Response("ok");
  }

  return new Response("method not allowed", { status: 405 });
}

async function handleItems(req: Request) {
  const db = getDatabase();
  if (req.method === "POST") {
    const { categoryId, text } = await req.json();
    if (!text || !categoryId) return new Response("categoryId and text required", { status: 400 });
    const maxSort = await db.sql`SELECT COALESCE(MAX(sort_order), 0) + 1 AS next FROM tips_items WHERE category_id = ${categoryId}`;
    const sortOrder = maxSort[0].next;
    await db.sql`INSERT INTO tips_items (category_id, text, sort_order) VALUES (${categoryId}, ${text}, ${sortOrder})`;
    return new Response("ok", { status: 201 });
  }

  if (req.method === "DELETE") {
    const url = new URL(req.url);
    const id = url.searchParams.get("id");
    if (!id) return new Response("id required", { status: 400 });
    await db.sql`DELETE FROM tips_items WHERE id = ${parseInt(id)}`;
    return new Response("ok");
  }

  return new Response("method not allowed", { status: 405 });
}

export default async (req: Request) => {
  const url = new URL(req.url);
  if (url.pathname.startsWith("/api/tips/items")) {
    return handleItems(req);
  }
  return handleCategories(req);
};

export const config: Config = {
  path: ["/api/tips/categories", "/api/tips/items"],
  method: ["POST", "DELETE"],
};
