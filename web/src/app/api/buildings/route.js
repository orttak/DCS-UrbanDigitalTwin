import { NextResponse } from 'next/server';
import { query } from '@/lib/db';

export async function GET() {
  try {
    // 3DCityDB v5 typically has a 'building' table in the 'citydb' schema (or whatever schema is set).
    // We'll try to query the 'building' table.
    // Note: The actual table name might be 'building' or 'cityobject' joined with building details depending on the exact schema version.
    // For v4/v5, 'building' table usually exists.
    // We will select a few columns. 'gmlid' is standard. 'name' might be in 'name' table or column depending on version.
    // Let's assume a simple query first. If it fails, we might need to adjust for specific 3DCityDB schema details.
    // In standard 3DCityDB, 'building' table has 'id', 'objectclass_id', etc.
    // 'cityobject' table has 'gmlid'.
    // Let's join building and cityobject to get gmlid.

    const sql = `
      SELECT 
        f.id,
        f.identifier as gmlid,
        oc.classname as name,
        f.creation_date
      FROM 
        ${process.env.DB_SCHEMA || 'citydb'}.feature f
      JOIN 
        ${process.env.DB_SCHEMA || 'citydb'}.objectclass oc ON f.objectclass_id = oc.id
      WHERE
        oc.classname = 'Building'
      LIMIT 50;
    `;

    const result = await query(sql);

    return NextResponse.json({ buildings: result.rows });
  } catch (error) {
    console.error('Database Error:', error);
    // If the table doesn't exist (empty DB might still have schema), or connection fails
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
