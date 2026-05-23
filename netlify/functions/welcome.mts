import { getDatabase } from "@netlify/database";
import type { Config } from "@netlify/functions";

export default async (req: Request) => {
  const db = getDatabase();
  if (req.method === "PUT") {
    const { content } = await req.json();
    await db.sql`UPDATE welcome_message SET content = ${content || ''}, updated_at = NOW() WHERE id = 1`;
    return new Response("ok");
  }

  return new Response("method not allowed", { status: 405 });
};

export const config: Config = {
  path: "/api/welcome",
  method: ["PUT"],
};
