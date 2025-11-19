const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: 'postgres',
    host: 'localhost',
    port: 5432,
    database: 'citydb',
});

async function checkClasses() {
    try {
        const client = await pool.connect();
        const res = await client.query(`
      SELECT id, classname, tablename 
      FROM citydb.objectclass 
      WHERE classname LIKE '%Building%' OR tablename LIKE '%building%'
      LIMIT 10;
    `);

        console.log('Object Classes:', res.rows);
        client.release();
        await pool.end();
    } catch (err) {
        console.error('Error:', err);
    }
}

checkClasses();
