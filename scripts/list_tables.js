const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: 'postgres',
    host: 'localhost',
    port: 5432,
    database: 'citydb',
});

async function listTables() {
    try {
        const client = await pool.connect();
        const res = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'citydb'
      ORDER BY table_name;
    `);

        console.log('Tables in citydb schema:', res.rows.map(r => r.table_name));
        client.release();
        await pool.end();
    } catch (err) {
        console.error('Error:', err);
    }
}

listTables();
