'use client';

import { useEffect, useState } from 'react';

export default function Home() {
    const [buildings, setBuildings] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        async function fetchBuildings() {
            try {
                const res = await fetch('/api/buildings');
                if (!res.ok) {
                    throw new Error(`Error: ${res.status}`);
                }
                const data = await res.json();
                if (data.error) {
                    throw new Error(data.error);
                }
                setBuildings(data.buildings || []);
            } catch (err) {
                setError(err.message);
            } finally {
                setLoading(false);
            }
        }

        fetchBuildings();
    }, []);

    return (
        <main className="min-h-screen p-8 bg-gray-50 text-gray-900 font-sans">
            <div className="max-w-4xl mx-auto">
                <h1 className="text-3xl font-bold mb-6 text-blue-600">3D City Playground</h1>

                <div className="bg-white shadow rounded-lg p-6">
                    <h2 className="text-xl font-semibold mb-4 border-b pb-2">Building List</h2>

                    {loading && <p className="text-gray-500">Loading buildings...</p>}

                    {error && (
                        <div className="bg-red-50 text-red-700 p-4 rounded mb-4">
                            <p><strong>Error connecting to DB:</strong> {error}</p>
                            <p className="text-sm mt-2">Make sure the Docker container is running and initialized.</p>
                        </div>
                    )}

                    {!loading && !error && buildings.length === 0 && (
                        <div className="text-gray-500 italic">
                            No buildings found. The database might be empty.
                            <br />
                            <span className="text-sm">Import some CityGML data to see results here.</span>
                        </div>
                    )}

                    {!loading && !error && buildings.length > 0 && (
                        <div className="overflow-x-auto">
                            <table className="min-w-full divide-y divide-gray-200">
                                <thead className="bg-gray-50">
                                    <tr>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">GML ID</th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Height</th>
                                    </tr>
                                </thead>
                                <tbody className="bg-white divide-y divide-gray-200">
                                    {buildings.map((b) => (
                                        <tr key={b.id}>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{b.id}</td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm font-mono text-gray-700">{b.gmlid}</td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-700">{b.name || '-'}</td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-700">{b.measured_height ? `${b.measured_height}m` : '-'}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    )}
                </div>

                <div className="mt-8 text-sm text-gray-500">
                    <p>
                        <strong>Tip:</strong> Use Blender to connect to <code>localhost:5432</code> and visualize these buildings in 3D.
                    </p>
                </div>
            </div>
        </main>
    );
}
