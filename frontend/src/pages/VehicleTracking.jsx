import { useState, useEffect, useContext, useCallback } from 'react';
import AuthContext from '../context/AuthContext';
import { useToast } from '../context/ToastContext';

const VehicleTracking = () => {
    const { api } = useContext(AuthContext);
    const toast = useToast();
    const [data, setData]             = useState(null);
    const [loading, setLoading]       = useState(true);
    const [error, setError]           = useState('');
    const [countdown, setCountdown]   = useState(30);
    const [filter, setFilter]         = useState('available'); // default: available vehicles only

    // Dispatch modal state
    const [dispatchModal, setDispatchModal] = useState(false);
    const [dispatchVehicle, setDispatchVehicle] = useState(null);
    const [destination, setDestination]     = useState('');
    const [dispatching, setDispatching]     = useState(false);
    const [recalling, setRecalling]         = useState(null); // v_id being recalled

    const fetchData = useCallback(async () => {
        setLoading(true);
        setError('');
        try {
            const res = await api.get('/vehicle_tracking.php');
            setData(res.data);
            setCountdown(30);
        } catch {
            setError('Failed to load vehicle data. Please try again.');
        } finally {
            setLoading(false);
        }
    }, [api]);

    useEffect(() => { fetchData(); }, [fetchData]);

    useEffect(() => {
        const interval = setInterval(() => {
            setCountdown(prev => {
                if (prev <= 1) { fetchData(); return 30; }
                return prev - 1;
            });
        }, 1000);
        return () => clearInterval(interval);
    }, [fetchData]);

    const allVehicles = data?.vehicles || [];
    const summary     = data?.summary  || { total: 0, pending_assignments: 0, on_trip: 0, available: 0 };

    const filtered = filter === 'all'      ? allVehicles
                   : filter === 'on_trip'  ? allVehicles.filter(v => v.status_label !== 'Available')
                   : allVehicles.filter(v => v.status_label === 'Available');

    const statusStyle = (label) => {
        if (label === 'On Trip')  return { bg: '#dcfce7', color: '#166534', dot: '#16a34a' };
        if (label === 'Assigned') return { bg: '#fef9c3', color: '#854d0e', dot: '#ca8a04' };
        return { bg: '#f1f5f9', color: '#475569', dot: '#94a3b8' };
    };

    const openDispatch = (vehicle) => {
        setDispatchVehicle(vehicle);
        setDestination('');
        setDispatchModal(true);
    };

    const closeDispatch = () => {
        setDispatchModal(false);
        setDispatchVehicle(null);
        setDestination('');
    };

    const handleRecall = async (vehicle) => {
        if (!window.confirm(`Recall vehicle ${vehicle.v_id} back to available?`)) return;
        setRecalling(vehicle.v_id);
        try {
            const res = await api.post('/vehicle_dispatch.php', { action: 'recall', v_id: vehicle.v_id });
            if (res.data.status === 'success') {
                toast(`Vehicle ${vehicle.v_id} recalled successfully.`);
                fetchData();
            } else {
                toast(res.data.message || 'Recall failed.', 'error');
            }
        } catch (err) {
            toast(err.response?.data?.message || 'Recall failed.', 'error');
        } finally {
            setRecalling(null);
        }
    };

    const handleDispatch = async (e) => {
        e.preventDefault();
        if (!dispatchVehicle) return;
        setDispatching(true);
        try {
            const res = await api.post('/vehicle_dispatch.php', {
                v_id: dispatchVehicle.v_id,
                destination: destination.trim()
            });
            if (res.data.status === 'success') {
                toast(`Vehicle ${dispatchVehicle.v_id} dispatched successfully.`);
                closeDispatch();
                fetchData();
            } else {
                toast(res.data.message || 'Dispatch failed.', 'error');
            }
        } catch (err) {
            toast(err.response?.data?.message || 'Dispatch failed.', 'error');
        } finally {
            setDispatching(false);
        }
    };

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div>
                    <div>
                        <h1>Vehicle Tracking</h1>
                        <p>Live view of all vehicles currently in yard — available for dispatch</p>
                    </div>
                </div>
            </div>

            <div className="page-body">
                {/* Summary Cards */}
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20, marginBottom: 28 }}>
                    <div
                        onClick={() => setFilter('all')}
                        style={{ background: filter === 'all' ? '#023149' : '#f0f9ff', border: `1px solid ${filter === 'all' ? '#023149' : '#bae6fd'}`, borderRadius: 12, padding: '20px 24px', cursor: 'pointer', transition: 'all .2s' }}
                    >
                        <span style={{ fontSize: 12, fontWeight: 700, color: filter === 'all' ? 'rgba(255,255,255,.7)' : '#0369a1', textTransform: 'uppercase', letterSpacing: '.05em' }}>Total Online</span>
                        <div style={{ fontSize: 36, fontWeight: 900, color: filter === 'all' ? '#fff' : '#023149', margin: '4px 0' }}>{summary.total}</div>
                        <span style={{ fontSize: 12, color: filter === 'all' ? 'rgba(255,255,255,.6)' : '#64748b' }}>vehicles logged in</span>
                    </div>
                    <div
                        style={{ background: '#fefce8', border: '1px solid #fde68a', borderRadius: 12, padding: '20px 24px', cursor: 'default', transition: 'all .2s' }}
                    >
                        <span style={{ fontSize: 12, fontWeight: 700, color: '#92400e', textTransform: 'uppercase', letterSpacing: '.05em' }}>Pending</span>
                        <div style={{ fontSize: 36, fontWeight: 900, color: '#854d0e', margin: '4px 0' }}>{summary.pending_assignments}</div>
                        <span style={{ fontSize: 12, color: '#64748b' }}>bookings awaiting dispatch</span>
                    </div>
                    <div
                        onClick={() => setFilter('on_trip')}
                        style={{ background: filter === 'on_trip' ? '#166534' : '#f0fdf4', border: `1px solid ${filter === 'on_trip' ? '#166534' : '#bbf7d0'}`, borderRadius: 12, padding: '20px 24px', cursor: 'pointer', transition: 'all .2s' }}
                    >
                        <span style={{ fontSize: 12, fontWeight: 700, color: filter === 'on_trip' ? 'rgba(255,255,255,.7)' : '#15803d', textTransform: 'uppercase', letterSpacing: '.05em' }}>On Trip</span>
                        <div style={{ fontSize: 36, fontWeight: 900, color: filter === 'on_trip' ? '#fff' : '#166534', margin: '4px 0' }}>{summary.on_trip}</div>
                        <span style={{ fontSize: 12, color: filter === 'on_trip' ? 'rgba(255,255,255,.6)' : '#64748b' }}>dispatched vehicles</span>
                    </div>
                    <div
                        onClick={() => setFilter('available')}
                        style={{ background: filter === 'available' ? '#475569' : '#f8fafc', border: `1px solid ${filter === 'available' ? '#475569' : '#e2e8f0'}`, borderRadius: 12, padding: '20px 24px', cursor: 'pointer', transition: 'all .2s' }}
                    >
                        <span style={{ fontSize: 12, fontWeight: 700, color: filter === 'available' ? 'rgba(255,255,255,.7)' : '#64748b', textTransform: 'uppercase', letterSpacing: '.05em' }}>Available</span>
                        <div style={{ fontSize: 36, fontWeight: 900, color: filter === 'available' ? '#fff' : '#334155', margin: '4px 0' }}>{summary.available}</div>
                        <span style={{ fontSize: 12, color: filter === 'available' ? 'rgba(255,255,255,.6)' : '#64748b' }}>vehicles ready to dispatch</span>
                    </div>
                </div>

                {/* Table Card */}
                <div style={{ background: '#fff', borderRadius: 12, border: '1px solid #e2e8f0', boxShadow: '0 1px 3px rgba(0,0,0,.08)' }}>
                    {/* Header */}
                    <div style={{ padding: '16px 24px', borderBottom: '1px solid #e2e8f0', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                            <span className="material-icons" style={{ color: '#023149', fontSize: 20 }}>sensors</span>
                            <span style={{ fontWeight: 800, fontSize: 15, color: '#0f172a' }}>
                                {filter === 'all' ? 'All Online Vehicles' : filter === 'on_trip' ? 'Dispatched Vehicles' : 'Available Vehicles'}
                            </span>
                            {!loading && (
                                <span style={{ background: '#f1f5f9', borderRadius: 20, padding: '2px 10px', fontSize: 12, fontWeight: 700, color: '#475569' }}>
                                    {filtered.length}
                                </span>
                            )}
                        </div>
                        <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
                            <span style={{ fontSize: 12, color: '#94a3b8' }}>
                                {loading ? 'Refreshing...' : `Auto-refresh in ${countdown}s`}
                            </span>
                            <button
                                onClick={fetchData}
                                disabled={loading}
                                style={{ display: 'flex', alignItems: 'center', gap: 6, padding: '7px 14px', background: loading ? '#e2e8f0' : '#023149', color: loading ? '#94a3b8' : '#fff', border: 'none', borderRadius: 8, fontWeight: 700, fontSize: 13, cursor: loading ? 'not-allowed' : 'pointer' }}
                            >
                                <span className="material-icons" style={{ fontSize: 16, animation: loading ? 'spin 1s linear infinite' : 'none' }}>refresh</span>
                                Refresh
                            </button>
                        </div>
                    </div>

                    {/* Error */}
                    {error && (
                        <div style={{ margin: 24, padding: '14px 18px', background: '#fef2f2', border: '1px solid #fecaca', borderRadius: 8, color: '#991b1b', fontSize: 14, fontWeight: 600, display: 'flex', alignItems: 'center', gap: 8 }}>
                            <span className="material-icons" style={{ fontSize: 18 }}>error</span>{error}
                        </div>
                    )}

                    {/* Loading */}
                    {loading && !data && (
                        <div style={{ padding: 40, textAlign: 'center', color: '#94a3b8' }}>
                            <span className="material-icons" style={{ fontSize: 40, marginBottom: 8, display: 'block', animation: 'spin 1s linear infinite' }}>sync</span>
                            Loading vehicles...
                        </div>
                    )}

                    {/* Empty */}
                    {!loading && !error && filtered.length === 0 && (
                        <div style={{ padding: 60, textAlign: 'center' }}>
                            <span className="material-icons" style={{ fontSize: 48, color: '#cbd5e1', display: 'block', marginBottom: 12 }}>directions_car</span>
                            <p style={{ fontWeight: 700, color: '#64748b', margin: 0 }}>No vehicles found</p>
                            <p style={{ fontSize: 13, color: '#94a3b8', margin: '4px 0 0' }}>
                                {filter === 'available' ? 'All online vehicles are currently dispatched' : 'No vehicles are currently online'}
                            </p>
                        </div>
                    )}

                    {/* Table */}
                    {filtered.length > 0 && (
                        <div style={{ overflowX: 'auto' }}>
                            <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 13 }}>
                                <thead>
                                    <tr style={{ background: '#f8fafc', borderBottom: '1px solid #e2e8f0' }}>
                                        {['#', 'Status', 'Vehicle', 'Type', 'Model', 'Driver', 'Location', 'Booking', 'Customer', 'Route', 'Login Time',
                                          ...(filter !== 'all' ? ['Action'] : [])
                                        ].map(h => (
                                            <th key={h} style={{ padding: '10px 14px', textAlign: 'left', fontSize: 11, fontWeight: 700, color: '#64748b', textTransform: 'uppercase', letterSpacing: '.05em', whiteSpace: 'nowrap' }}>{h}</th>
                                        ))}
                                    </tr>
                                </thead>
                                <tbody>
                                    {filtered.map((v, i) => {
                                        const s = statusStyle(v.status_label);
                                        return (
                                            <tr key={v.v_id}
                                                style={{ borderBottom: '1px solid #f1f5f9', background: i % 2 === 0 ? '#fff' : '#fafafa' }}
                                                onMouseEnter={e => e.currentTarget.style.background = '#f0f9ff'}
                                                onMouseLeave={e => e.currentTarget.style.background = i % 2 === 0 ? '#fff' : '#fafafa'}
                                            >
                                                <td style={{ padding: '12px 14px', color: '#94a3b8', fontWeight: 600 }}>{i + 1}</td>
                                                <td style={{ padding: '12px 14px' }}>
                                                    <span style={{ display: 'inline-flex', alignItems: 'center', gap: 5, padding: '3px 10px', borderRadius: 20, fontSize: 11, fontWeight: 700, background: s.bg, color: s.color }}>
                                                        <span style={{ width: 6, height: 6, borderRadius: '50%', background: s.dot, display: 'inline-block' }} />
                                                        {v.status_label}
                                                    </span>
                                                </td>
                                                <td style={{ padding: '12px 14px' }}>
                                                    <div style={{ fontWeight: 800, color: '#023149' }}>{v.v_id}</div>
                                                    <div style={{ fontSize: 11, color: '#64748b', marginTop: 2 }}>{v.v_no || ''}</div>
                                                </td>
                                                <td style={{ padding: '12px 14px' }}>
                                                    {v.v_cat && <span style={{ display: 'inline-block', background: '#dbeafe', color: '#1d4ed8', borderRadius: 4, padding: '2px 8px', fontSize: 11, fontWeight: 700 }}>{v.v_cat}</span>}
                                                </td>
                                                <td style={{ padding: '12px 14px', fontWeight: 600, color: '#334155', fontSize: 13 }}>
                                                    {v.v_model || '—'}
                                                </td>
                                                <td style={{ padding: '12px 14px' }}>
                                                    <div style={{ fontWeight: 600, color: '#0f172a' }}>{v.d_name || '—'}</div>
                                                    <div style={{ fontSize: 11, color: '#64748b' }}>{v.d_mobile || ''}</div>
                                                </td>
                                                <td style={{ padding: '12px 14px', color: '#475569', fontWeight: 500 }}>
                                                    {v.vacant_place || '—'}
                                                </td>
                                                <td style={{ padding: '12px 14px', fontFamily: 'monospace', fontWeight: 700, color: '#023149' }}>
                                                    {v.b_id || '—'}
                                                </td>
                                                <td style={{ padding: '12px 14px' }}>
                                                    <div style={{ fontWeight: 600, color: '#0f172a' }}>{v.b_name || '—'}</div>
                                                    <div style={{ fontSize: 11, color: '#64748b' }}>{v.m_no || ''}</div>
                                                </td>
                                                <td style={{ padding: '12px 14px' }}>
                                                    {v.p_city ? (
                                                        <div style={{ display: 'flex', alignItems: 'center', gap: 6, color: '#334155' }}>
                                                            <span style={{ fontWeight: 700, color: '#023149' }}>{v.p_city}</span>
                                                            <span className="material-icons" style={{ fontSize: 14, color: '#94a3b8' }}>arrow_forward</span>
                                                            <span>{v.d_place}</span>
                                                        </div>
                                                    ) : '—'}
                                                </td>
                                                <td style={{ padding: '12px 14px', color: '#64748b', whiteSpace: 'nowrap', fontSize: 12 }}>
                                                    {v.login_time ? new Date(v.login_time).toLocaleString('en-IN', { day: '2-digit', month: 'short', hour: '2-digit', minute: '2-digit' }) : '—'}
                                                </td>
                                                {filter !== 'all' && (
                                                    <td style={{ padding: '12px 14px' }}>
                                                        {filter === 'available' ? (
                                                            <button
                                                                onClick={() => openDispatch(v)}
                                                                style={{ display: 'inline-flex', alignItems: 'center', gap: 5, padding: '5px 12px', background: '#023149', color: '#fff', border: 'none', borderRadius: 6, fontWeight: 700, fontSize: 12, cursor: 'pointer' }}
                                                            >
                                                                <span className="material-icons" style={{ fontSize: 14 }}>local_shipping</span>
                                                                Dispatch
                                                            </button>
                                                        ) : (!v.b_id ? (
                                                            <button
                                                                onClick={() => handleRecall(v)}
                                                                disabled={recalling === v.v_id}
                                                                style={{ display: 'inline-flex', alignItems: 'center', gap: 5, padding: '5px 12px', background: recalling === v.v_id ? '#e2e8f0' : '#7f1d1d', color: recalling === v.v_id ? '#94a3b8' : '#fff', border: 'none', borderRadius: 6, fontWeight: 700, fontSize: 12, cursor: recalling === v.v_id ? 'not-allowed' : 'pointer' }}
                                                            >
                                                                <span className="material-icons" style={{ fontSize: 14 }}>undo</span>
                                                                {recalling === v.v_id ? 'Recalling…' : 'Recall'}
                                                            </button>
                                                        ) : '—')}
                                                    </td>
                                                )}
                                            </tr>
                                        );
                                    })}
                                </tbody>
                            </table>
                        </div>
                    )}
                </div>
            </div>

            {/* Dispatch Modal */}
            {dispatchModal && dispatchVehicle && (
                <div style={{ position: 'fixed', inset: 0, background: 'rgba(0,0,0,.45)', zIndex: 1000, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                    <div style={{ background: '#fff', borderRadius: 14, padding: 32, width: 420, maxWidth: '90vw', boxShadow: '0 20px 60px rgba(0,0,0,.2)' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 20 }}>
                            <span className="material-icons" style={{ color: '#023149', fontSize: 24 }}>local_shipping</span>
                            <h2 style={{ margin: 0, fontSize: 18, fontWeight: 800, color: '#0f172a' }}>Dispatch Vehicle</h2>
                        </div>

                        {/* Vehicle info */}
                        <div style={{ background: '#f8fafc', borderRadius: 8, padding: '12px 16px', marginBottom: 20, border: '1px solid #e2e8f0' }}>
                            <div style={{ fontWeight: 800, fontSize: 15, color: '#023149' }}>{dispatchVehicle.v_id}</div>
                            <div style={{ fontSize: 13, color: '#475569', marginTop: 2 }}>
                                {dispatchVehicle.d_name || '—'} · {dispatchVehicle.v_no || '—'}
                            </div>
                            <div style={{ fontSize: 12, color: '#94a3b8', marginTop: 2 }}>
                                Location: {dispatchVehicle.vacant_place || 'Unspecified'}
                            </div>
                        </div>

                        <form onSubmit={handleDispatch}>
                            <label style={{ display: 'block', fontSize: 12, fontWeight: 700, color: '#374151', marginBottom: 6, textTransform: 'uppercase', letterSpacing: '.05em' }}>
                                Destination / Purpose
                            </label>
                            <input
                                type="text"
                                placeholder="e.g. Airport, City Centre..."
                                value={destination}
                                onChange={e => setDestination(e.target.value)}
                                style={{ width: '100%', height: 40, padding: '0 12px', border: '1px solid #d1d5db', borderRadius: 6, fontSize: 14, boxSizing: 'border-box', outline: 'none', marginBottom: 20 }}
                            />
                            <div style={{ display: 'flex', gap: 10, justifyContent: 'flex-end' }}>
                                <button
                                    type="button"
                                    onClick={closeDispatch}
                                    disabled={dispatching}
                                    style={{ padding: '9px 20px', background: '#f1f5f9', color: '#475569', border: 'none', borderRadius: 7, fontWeight: 700, fontSize: 13, cursor: 'pointer' }}
                                >
                                    Cancel
                                </button>
                                <button
                                    type="submit"
                                    disabled={dispatching}
                                    style={{ display: 'flex', alignItems: 'center', gap: 6, padding: '9px 20px', background: dispatching ? '#e2e8f0' : '#023149', color: dispatching ? '#94a3b8' : '#fff', border: 'none', borderRadius: 7, fontWeight: 700, fontSize: 13, cursor: dispatching ? 'not-allowed' : 'pointer' }}
                                >
                                    <span className="material-icons" style={{ fontSize: 15 }}>local_shipping</span>
                                    {dispatching ? 'Dispatching…' : 'Confirm Dispatch'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            <style>{`
                @keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
            `}</style>
        </div>
    );
};

export default VehicleTracking;
