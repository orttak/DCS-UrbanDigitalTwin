const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: 'postgres',
    host: 'localhost',
    port: 5432,
    database: 'citydb',
});

async function checkClassNames() {
    try {
        const client = await pool.connect();
        const res = await client.query(`
      SELECT id, classname 
      FROM citydb.objectclass 
      WHERE classname LIKE '%Building%'
      LIMIT 5;
    `);

        console.log('Building Classes:', res.rows);
        client.release();
        await pool.end();
    } catch (err) {
        console.error('Error:', err);
    }
}

checkClassNames();
