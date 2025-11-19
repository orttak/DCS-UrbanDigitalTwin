const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: 'postgres',
    host: 'localhost',
    port: 5432,
    database: 'citydb',
});

async function listColumns() {
    try {
        const client = await pool.connect();

        const tables = ['feature', 'objectclass'];

        for (const table of tables) {
            const res = await client.query(`
        SELECT column_name, data_type 
        FROM information_schema.columns 
        WHERE table_schema = 'citydb' AND table_name = '${table}';
        `);
            console.log(`Columns in ${table}:`, res.rows.map(r => r.column_name));
        }

        client.release();
        await pool.end();
    } catch (err) {
        console.error('Error:', err);
    }
}

listColumns();
