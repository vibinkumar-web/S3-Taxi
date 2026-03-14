import { useState, useEffect, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { formatBookingId } from '../constants';

const OnTrip = () => {
    const { api } = useContext(AuthContext);
    const [trips, setTrips] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchTrips();
    }, []);

    const fetchTrips = async () => {
        setLoading(true);
        try {
            const res = await api.get('/ontrip.php');
            setTrips(res.data ?? []);
        } catch (e) {
            console.error('Error fetching on-trip data', e);
        } finally {
            setLoading(false);
        }
    };

    const fmt = (val) => val ?? '—';

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div>
                    <div>
                        <h1>Live Operations (On-Trip)</h1>
                        <p>Monitor all currently dispatched vehicles and their trip status</p>
                    </div>
                </div>
            </div>

            <div className="page-body">
                <div className="table-wrap">
                    <div style={{ background: '#f8fafc', padding: '16px 24px', display: 'flex', alignItems: 'center', justifyContent: 'space-between', borderBottom: '2px solid #e2e8f0' }}>
                        <h2 style={{ margin: 0, fontSize: 14, fontWeight: 800, color: '#023149', letterSpacing: '.05em', textTransform: 'uppercase', display: 'flex', alignItems: 'center', gap: 8 }}>
                            <span className="material-icons" style={{ fontSize: 18, color: '#689abb' }}>gps_fixed</span>
                            Active Dispatched Trips
                        </h2>
                        <button
                            onClick={fetchTrips}
                            className="btn-ghost"
                            style={{ padding: '6px 16px', background: 'transparent', color: '#023149' }}
                        >
                            <span className="material-icons" style={{ fontSize: 16 }}>sync</span>
                            Refresh
                        </button>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Dispatch Time</th>
                                <th>Pickup Time</th>
                                <th>Pickup</th>
                                <th>Drop</th>
                                <th>Vehicle Type</th>
                                <th>Vehicle ID</th>
                                <th>Customer</th>
                                <th style={{ textAlign: 'center' }}>Opening KM</th>
                                <th style={{ textAlign: 'center' }}>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr>
                                    <td colSpan={10} style={{ textAlign: 'center', padding: '60px 20px', color: '#6b7280' }}>
                                        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 12 }}>
                                            <span className="material-icons" style={{ fontSize: 32, color: '#cbd5e1' }}>sync</span>
                                            <div>Loading active trips...</div>
                                        </div>
                                    </td>
                                </tr>
                            ) : trips.length === 0 ? (
                                <tr>
                                    <td colSpan={10} style={{ textAlign: 'center', padding: '60px 20px', color: '#6b7280' }}>
                                        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 12 }}>
                                            <span className="material-icons" style={{ fontSize: 32, color: '#cbd5e1' }}>not_listed_location</span>
                                            <div>No active trips at the moment.</div>
                                        </div>
                                    </td>
                                </tr>
                            ) : (
                                trips.map((trip) => (
                                    <tr key={trip.b_id} style={{
                                        background: trip.open_km ? '#f8fafc' : '#fff',
                                        borderLeft: trip.open_km ? '4px solid #10b981' : '4px solid transparent',
                                    }}>
                                        <td style={{ fontWeight: 800, color: '#023149', fontFamily: 'monospace', fontSize: 13 }}>{formatBookingId(trip.b_id)}</td>
                                        <td style={{ fontSize: 12, color: '#6b7280' }}>{fmt(trip.assign_time)}</td>
                                        <td style={{ fontWeight: 600, color: '#023149' }}>{fmt(trip.bookin_time)}</td>
                                        <td style={{ maxWidth: 120, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }} title={trip.p_city}>{fmt(trip.p_city)}</td>
                                        <td style={{ maxWidth: 120, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }} title={trip.d_place}>{fmt(trip.d_place)}</td>
                                        <td><span className="badge badge-gray">{fmt(trip.v_type)}</span></td>
                                        <td style={{ fontWeight: 800, color: '#023149', fontSize: 15 }}>{fmt(trip.v_id)}</td>
                                        <td>
                                            <div style={{ fontWeight: 600, color: '#023149', maxWidth: 140, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{fmt(trip.b_name)}</div>
                                            <div style={{ fontSize: 12, color: '#6b7280' }}>Tel: {fmt(trip.m_no)}</div>
                                        </td>
                                        <td style={{ textAlign: 'center' }}>
                                            {trip.open_km ? (
                                                <div style={{ display: 'inline-block', background: '#dcfce7', color: '#166534', padding: '4px 8px', borderRadius: 4, fontWeight: 800, fontSize: 13, border: '1px solid #bbf7d0' }}>
                                                    {trip.open_km} <span style={{ fontSize: 10, opacity: 0.8 }}>KM</span>
                                                </div>
                                            ) : (
                                                <span style={{ color: '#a1a1aa', fontSize: 13 }}>—</span>
                                            )}
                                        </td>
                                        <td style={{ textAlign: 'center' }}>
                                            {trip.open_km ? (
                                                <span className="badge badge-green" style={{ display: 'inline-flex', alignItems: 'center', gap: 4 }}>
                                                    <span className="material-icons" style={{ fontSize: 12 }}>route</span> In Transit
                                                </span>
                                            ) : (
                                                <span className="badge badge-yellow" style={{ display: 'inline-flex', alignItems: 'center', gap: 4 }}>
                                                    <span className="material-icons" style={{ fontSize: 12 }}>power_settings_new</span> Dispatched
                                                </span>
                                            )}
                                        </td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
};

export default OnTrip;
