import { useState, useEffect, useContext } from 'react';
import { useToast } from '../context/ToastContext';
import { fmtDateTime } from '../utils/dateFormat';

        

        

import AuthContext from '../context/AuthContext';
const VehicleInOut = () => {
    const toast = useToast();
const { api } = useContext(AuthContext);
    const [vehicles, setVehicles] = useState([]);
    const [loading, setLoading] = useState(true);
    const [singleVid, setSingleVid] = useState('');
    const [loggingOut, setLoggingOut] = useState(false);
    const [loginVid, setLoginVid] = useState('');
    const [loginLocation, setLoginLocation] = useState('');
    const [loggingIn, setLoggingIn] = useState(false);

    useEffect(() => {
        fetchActiveVehicles();
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    const fetchActiveVehicles = async () => {
        setLoading(true);
        try {
            const response = await api.get('/vehicle_in_out.php');
            setVehicles(Array.isArray(response.data) ? response.data : []);
        } catch (error) {
            console.error("Error fetching active vehicles", error);
        } finally {
            setLoading(false);
        }
    };

    const handleLoginSingle = async (e) => {
        e.preventDefault();
        if (!loginVid.trim()) { toast('Please enter a Vehicle ID.', 'error'); return; }
        setLoggingIn(true);
        try {
            const res = await api.post('/vehicle_in_out.php', {
                action: 'login_single',
                v_id: loginVid.trim(),
                location: loginLocation.trim()
            });
            if (res.data.status === 'success') {
                toast(`Vehicle ${loginVid} logged in successfully.`);
                setLoginVid('');
                setLoginLocation('');
                fetchActiveVehicles();
            } else {
                toast(res.data.message || 'Login failed.', 'error');
            }
        } catch (err) {
            toast(err.response?.data?.message || 'Vehicle not found or already logged in.', 'error');
        } finally {
            setLoggingIn(false);
        }
    };

    const handleClearStale = async () => {
        if (!window.confirm("Clear all old stale dispatch records? This fixes vehicles still showing as unavailable from previous sessions.")) return;
        try {
            const res = await api.post('/cleanup_stale_dispatch.php');
            toast(res.data.message || 'Stale records cleared.');
        } catch {
            toast('Failed to clear stale records.', 'error');
        }
    };

    const handleLogoutAll = async () => {
        if (!window.confirm("Are you sure you want to instantly log out all currently active vehicles? This will calculate their final attendance duration.")) {
            return;
        }

        setLoggingOut(true);
        try {
            const response = await api.post('/vehicle_in_out.php', { action: 'logout_all' });
            if (response.data.status === 'success') {
                toast(response.data.message, 'error');
                fetchActiveVehicles(); // Refresh table
            } else {
                toast("Failed to log out all vehicles.", 'error');
            }
        } catch (error) {
            console.error("Error logging out all vehicles", error);
            toast("An error occurred during mass logout.", 'error');
        } finally {
            setLoggingOut(false);
        }
    };

    const handleLogoutSingle = async (e) => {
        e.preventDefault();
        if (!singleVid.trim()) {
            toast("Please enter a Vehicle ID to logout.", 'warning');
            return;
        }

        setLoggingOut(true);
        try {
            const response = await api.post('/vehicle_in_out.php', {
                action: 'logout_single',
                v_id: singleVid.trim()
            });

            if (response.data.status === 'success') {
                toast(`Vehicle ${singleVid} logged out successfully.`);
                setSingleVid('');
                fetchActiveVehicles();
            } else {
                toast(response.data.message || `Failed to log out vehicle ${singleVid}.`, 'error');
            }
        } catch (error) {
            console.error("Error logging out single vehicle", error);
            toast(error.response?.data?.message || "Active vehicle not found or already logged out.", 'error');
        } finally {
            setLoggingOut(false);
        }
    };

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div>
                    <div>
                        <h1>Vehicle In & Out Matrix</h1>
                        <p>Monitor real-time active vehicles and process mass logouts</p>
                    </div>
                </div>
            </div>

            <div className="page-body">

                {/* Combined Control Bar */}
                <div className="section" style={{ padding: '20px 28px', marginBottom: 24, background: '#fff', border: '1px solid #e2e8f0' }}>
                    <div style={{ display: 'flex', gap: 0, alignItems: 'stretch', flexWrap: 'wrap' }}>

                        {/* Active count */}
                        <div style={{ display: 'flex', alignItems: 'center', gap: 8, padding: '0 24px 0 0', marginRight: 24, borderRight: '1px solid #e2e8f0' }}>
                            <span className="material-icons" style={{ fontSize: 20, color: '#0369a1' }}>radar</span>
                            <div>
                                <div style={{ fontSize: 11, color: '#6b7280', fontWeight: 700, textTransform: 'uppercase', letterSpacing: '.05em' }}>Active</div>
                                <div style={{ fontSize: 22, fontWeight: 900, color: '#023149', lineHeight: 1 }}>{loading ? '…' : vehicles.length}</div>
                            </div>
                        </div>

                        {/* LOGIN section */}
                        <div style={{ marginRight: 24, paddingRight: 24, borderRight: '1px solid #e2e8f0' }}>
                            <div style={{ fontSize: 11, fontWeight: 800, color: '#15803d', textTransform: 'uppercase', letterSpacing: '.05em', marginBottom: 8, display: 'flex', alignItems: 'center', gap: 4 }}>
                                <span className="material-icons" style={{ fontSize: 14 }}>login</span> Login Vehicle
                            </div>
                            <form onSubmit={handleLoginSingle} style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
                                <input
                                    type="text"
                                    placeholder="Vehicle ID"
                                    value={loginVid}
                                    onChange={e => setLoginVid(e.target.value)}
                                    style={{ height: 38, padding: '0 12px', width: 120, fontSize: 13, fontWeight: 700, border: '1px solid #86efac', borderRadius: 6, outline: 'none', color: '#023149' }}
                                />
                                <input
                                    type="text"
                                    placeholder="Location"
                                    value={loginLocation}
                                    onChange={e => setLoginLocation(e.target.value)}
                                    style={{ height: 38, padding: '0 12px', width: 140, fontSize: 13, border: '1px solid #86efac', borderRadius: 6, outline: 'none', color: '#023149' }}
                                />
                                <button type="submit" disabled={loggingIn || !loginVid.trim()} style={{
                                    height: 38, padding: '0 18px', border: 'none', borderRadius: 6, fontWeight: 700, fontSize: 13,
                                    background: loggingIn || !loginVid.trim() ? '#e2e8f0' : '#15803d',
                                    color: loggingIn || !loginVid.trim() ? '#94a3b8' : '#fff',
                                    cursor: loggingIn || !loginVid.trim() ? 'not-allowed' : 'pointer',
                                    display: 'flex', alignItems: 'center', gap: 6
                                }}>
                                    <span className="material-icons" style={{ fontSize: 15 }}>how_to_reg</span>
                                    {loggingIn ? 'Logging in…' : 'Login'}
                                </button>
                            </form>
                        </div>

                        {/* LOGOUT section */}
                        <div style={{ marginRight: 24, paddingRight: 24, borderRight: '1px solid #e2e8f0' }}>
                            <div style={{ fontSize: 11, fontWeight: 800, color: '#c5111a', textTransform: 'uppercase', letterSpacing: '.05em', marginBottom: 8, display: 'flex', alignItems: 'center', gap: 4 }}>
                                <span className="material-icons" style={{ fontSize: 14 }}>logout</span> Logout Vehicle
                            </div>
                            <form onSubmit={handleLogoutSingle} style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
                                <input
                                    type="text"
                                    placeholder="Vehicle ID"
                                    value={singleVid}
                                    onChange={e => setSingleVid(e.target.value)}
                                    style={{ height: 38, padding: '0 12px', width: 120, fontSize: 13, fontWeight: 700, border: '1px solid #fecaca', borderRadius: 6, outline: 'none', color: '#023149' }}
                                />
                                <button type="submit" disabled={loggingOut || !singleVid.trim()} style={{
                                    height: 38, padding: '0 18px', border: 'none', borderRadius: 6, fontWeight: 700, fontSize: 13,
                                    background: loggingOut || !singleVid.trim() ? '#e2e8f0' : '#c5111a',
                                    color: loggingOut || !singleVid.trim() ? '#94a3b8' : '#fff',
                                    cursor: loggingOut || !singleVid.trim() ? 'not-allowed' : 'pointer',
                                    display: 'flex', alignItems: 'center', gap: 6
                                }}>
                                    <span className="material-icons" style={{ fontSize: 15 }}>power_settings_new</span>
                                    {loggingOut ? 'Processing…' : 'Logout'}
                                </button>
                            </form>
                        </div>

                        {/* Logout ALL */}
                        <div style={{ display: 'flex', alignItems: 'flex-end', gap: 10 }}>
                            <div>
                                <div style={{ fontSize: 11, fontWeight: 800, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.05em', marginBottom: 8 }}>Mass Action</div>
                                <div style={{ display: 'flex', gap: 8 }}>
                                    <button onClick={handleLogoutAll} disabled={loggingOut || vehicles.length === 0} style={{
                                        height: 38, padding: '0 18px', border: 'none', borderRadius: 6, fontWeight: 700, fontSize: 13,
                                        background: loggingOut || vehicles.length === 0 ? '#e2e8f0' : '#7f1d1d',
                                        color: loggingOut || vehicles.length === 0 ? '#94a3b8' : '#fff',
                                        cursor: loggingOut || vehicles.length === 0 ? 'not-allowed' : 'pointer',
                                        display: 'flex', alignItems: 'center', gap: 6
                                    }}>
                                        <span className="material-icons" style={{ fontSize: 15 }}>power_settings_new</span>
                                        {loggingOut ? 'Processing…' : 'Logout All'}
                                    </button>
                                    <button onClick={handleClearStale} title="Clear old dispatch records that block vehicles from appearing as available" style={{
                                        height: 38, padding: '0 14px', border: '1px solid #d1d5db', borderRadius: 6, fontWeight: 700, fontSize: 13,
                                        background: '#fff', color: '#6b7280', cursor: 'pointer',
                                        display: 'flex', alignItems: 'center', gap: 6
                                    }}>
                                        <span className="material-icons" style={{ fontSize: 15 }}>cleaning_services</span>
                                        Clear Stale
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                {/* Active Vehicles Table */}
                <div className="table-wrap">
                    <div style={{ padding: '16px 24px', background: '#fdf6e8', borderBottom: '1px solid #e8d4aa', display: 'flex', alignItems: 'center', gap: 8 }}>
                        <span className="material-icons" style={{ fontSize: 18, color: '#15803d' }}>sensors</span>
                        <h3 style={{ margin: 0, fontSize: 13, fontWeight: 800, color: '#023149', textTransform: 'uppercase', letterSpacing: '.05em' }}>
                            Currently Active Vehicles
                        </h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Vehicle-ID</th>
                                <th>Driver Name</th>
                                <th>Vehicle No</th>
                                <th>Type</th>
                                <th>Model</th>
                                <th>Vacant Location</th>
                                <th style={{ textAlign: 'right' }}>Login Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr>
                                    <td colSpan="7" style={{ textAlign: 'center', padding: '60px 40px', color: '#6b7280' }}>
                                        Loading active vehicles network...
                                    </td>
                                </tr>
                            ) : vehicles.length === 0 ? (
                                <tr>
                                    <td colSpan="7" style={{ textAlign: 'center', padding: '60px 40px', color: '#6b7280' }}>
                                        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8 }}>
                                            <span className="material-icons" style={{ fontSize: 32, color: '#cbd5e1' }}>power_off</span>
                                            <div>All vehicles are currently logged out or off-duty.</div>
                                        </div>
                                    </td>
                                </tr>
                            ) : (
                                vehicles.map((v, i) => (
                                    <tr key={i}>
                                        <td>
                                            <span style={{ fontWeight: 800, color: '#023149', fontFamily: 'monospace', padding: '4px 8px', background: '#f8fafc', borderRadius: 4, border: '1px solid #e2e8f0' }}>
                                                {v.v_id}
                                            </span>
                                        </td>
                                        <td style={{ fontWeight: 600, color: '#334155' }}>
                                            {v.d_name || '—'}
                                        </td>
                                        <td style={{ fontWeight: 700, color: '#023149', fontSize: 13 }}>
                                            {v.v_no || '—'}
                                        </td>
                                        <td>
                                            <span className="badge badge-blue">{v.v_cat || '—'}</span>
                                        </td>
                                        <td style={{ fontWeight: 600, color: '#334155' }}>
                                            {v.v_model || '—'}
                                        </td>
                                        <td>
                                            <span className="badge badge-yellow">
                                                {v.vacant_place || 'UNSPECIFIED'}
                                            </span>
                                        </td>
                                        <td style={{ textAlign: 'right', fontWeight: 600, color: '#15803d', fontSize: 13 }}>
                                            {fmtDateTime(v.login_time)}
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

export default VehicleInOut;
