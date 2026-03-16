import { useState, useEffect, useContext, useCallback, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import AuthContext from '../context/AuthContext';
import { formatBookingId, PAGE_LIMIT } from '../constants';

const today = () => new Date().toISOString().slice(0, 10);
const daysAgo = (n) => { const d = new Date(); d.setDate(d.getDate() - n); return d.toISOString().slice(0, 10); };
const startOfWeek = () => { const d = new Date(); d.setDate(d.getDate() - d.getDay()); return d.toISOString().slice(0, 10); };
const startOfMonth = () => { const d = new Date(); d.setDate(1); return d.toISOString().slice(0, 10); };

const DATE_PRESETS = [
    { label: 'Today',      from: today,            to: today },
    { label: 'Yesterday',  from: () => daysAgo(1), to: () => daysAgo(1) },
    { label: 'This Week',  from: startOfWeek,      to: today },
    { label: 'This Month', from: startOfMonth,     to: today },
    { label: 'All',        from: () => '',         to: () => '' },
];

const DisplayBookings = () => {
    const { api } = useContext(AuthContext);
    const navigate = useNavigate();

    const [bookings, setBookings] = useState([]);
    const [total, setTotal] = useState(0);
    const [pages, setPages] = useState(1);
    const [loading, setLoading] = useState(true);

    const [searchInput, setSearchInput] = useState('');
    const [search, setSearch] = useState('');
    const [statusFilter, setStatusFilter] = useState('');
    const [activePreset, setActivePreset] = useState('All');
    const [fromDate, setFromDate] = useState('');
    const [toDate, setToDate] = useState('');
    const [showCustom, setShowCustom] = useState(false);
    const [page, setPage] = useState(1);

    const searchTimer = useRef(null);
    const abortRef = useRef(null);

    const fetchBookings = useCallback(async (params) => {
        // Cancel previous in-flight request
        if (abortRef.current) abortRef.current.abort();
        abortRef.current = new AbortController();

        setLoading(true);
        try {
            const query = new URLSearchParams();
            if (params.from_date) query.set('from_date', params.from_date);
            if (params.to_date)   query.set('to_date',   params.to_date);
            if (params.status)    query.set('status',    params.status);
            if (params.search)    query.set('search',    params.search);
            query.set('page',  params.page ?? 1);
            query.set('limit', PAGE_LIMIT);
            // 'all' flag tells backend: no default date filter
            if (!params.from_date && !params.to_date) query.set('all', '1');

            const res = await api.get(`/bookings.php?${query.toString()}`);
            const data = res.data;
            setBookings(Array.isArray(data?.bookings) ? data.bookings : []);
            setTotal(data?.total ?? 0);
            setPages(data?.pages ?? 1);
        } catch (e) {
            if (e?.code !== 'ERR_CANCELED') setBookings([]);
        } finally {
            setLoading(false);
        }
    }, [api]);

    useEffect(() => {
        fetchBookings({ from_date: fromDate, to_date: toDate, status: statusFilter, search, page });
    }, [fromDate, toDate, statusFilter, search, page]);

    const handleSearchInput = (val) => {
        setSearchInput(val);
        if (searchTimer.current) clearTimeout(searchTimer.current);
        searchTimer.current = setTimeout(() => { setSearch(val); setPage(1); }, 400);
    };

    const applyPreset = (preset) => {
        setActivePreset(preset.label);
        setShowCustom(false);
        setFromDate(preset.from());
        setToDate(preset.to());
        setPage(1);
    };

    const handleStatusFilter = (val) => { setStatusFilter(val); setPage(1); };

    const clearAll = () => {
        setSearchInput(''); setSearch(''); setStatusFilter('');
        applyPreset(DATE_PRESETS[4]); // All
    };

    const hasFilters = searchInput || statusFilter || activePreset !== 'All';

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', width: '100%' }}>
                    <div>
                        <h1>All Bookings</h1>
                        <p>Complete history of all registered bookings</p>
                    </div>
                    <div style={{ background: 'rgba(255,255,255,0.12)', borderRadius: 10, padding: '10px 20px', textAlign: 'center', border: '1px solid rgba(255,255,255,0.18)' }}>
                        <div style={{ fontSize: 11, color: 'rgba(255,255,255,0.65)', textTransform: 'uppercase', letterSpacing: '.07em', fontWeight: 700 }}>Showing</div>
                        <div style={{ fontSize: 24, fontWeight: 900, color: '#fff' }}>
                            {loading ? '…' : bookings.length}
                            <span style={{ fontSize: 13, opacity: 0.7 }}> / {total}</span>
                        </div>
                    </div>
                </div>
            </div>

            <div className="page-body">

                {/* Filter Bar */}
                <div style={{ background: '#fff', border: '1px solid #e2e8f0', borderRadius: 10, padding: '16px 20px', marginBottom: 20, display: 'flex', flexWrap: 'wrap', gap: 12, alignItems: 'flex-end' }}>

                    {/* Search */}
                    <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
                        <label style={labelStyle}>Search</label>
                        <div style={{ position: 'relative' }}>
                            <span className="material-icons" style={{ position: 'absolute', left: 10, top: '50%', transform: 'translateY(-50%)', fontSize: 16, color: '#94a3b8' }}>search</span>
                            <input
                                type="text"
                                value={searchInput}
                                onChange={e => handleSearchInput(e.target.value)}
                                placeholder="Name, mobile, booking ID..."
                                style={{ paddingLeft: 32, height: 36, width: 220, fontSize: 13, border: '1px solid #e2e8f0', borderRadius: 6, outline: 'none' }}
                            />
                        </div>
                    </div>

                    {/* Status */}
                    <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
                        <label style={labelStyle}>Status</label>
                        <div style={{ display: 'flex', gap: 4 }}>
                            {[['', 'All'], ['awaiting', 'Awaiting'], ['assigned', 'Assigned']].map(([val, lbl]) => (
                                <button key={val} onClick={() => handleStatusFilter(val)} style={filterBtn(statusFilter === val)}>
                                    {lbl}
                                </button>
                            ))}
                        </div>
                    </div>

                    {/* Date Presets */}
                    <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
                        <label style={labelStyle}>Date</label>
                        <div style={{ display: 'flex', gap: 4 }}>
                            {DATE_PRESETS.map(p => (
                                <button key={p.label} onClick={() => applyPreset(p)} style={filterBtn(activePreset === p.label, '#0369a1')}>
                                    {p.label}
                                </button>
                            ))}
                            <button onClick={() => { setActivePreset('Custom'); setShowCustom(true); }} style={filterBtn(activePreset === 'Custom', '#0369a1')}>
                                <span className="material-icons" style={{ fontSize: 14 }}>date_range</span>
                                Custom
                            </button>
                        </div>
                    </div>

                    {/* Custom Date Inputs */}
                    {showCustom && (
                        <>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
                                <label style={labelStyle}>From</label>
                                <input type="date" value={fromDate} onChange={e => { setFromDate(e.target.value); setPage(1); }}
                                    style={{ height: 36, padding: '0 10px', fontSize: 13, border: '1px solid #e2e8f0', borderRadius: 6, outline: 'none' }} />
                            </div>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
                                <label style={labelStyle}>To</label>
                                <input type="date" value={toDate} onChange={e => { setToDate(e.target.value); setPage(1); }}
                                    style={{ height: 36, padding: '0 10px', fontSize: 13, border: '1px solid #e2e8f0', borderRadius: 6, outline: 'none' }} />
                            </div>
                        </>
                    )}

                    {hasFilters && (
                        <button onClick={clearAll} style={{ height: 36, padding: '0 14px', fontSize: 12, fontWeight: 700, borderRadius: 6, border: '1px solid #fecaca', background: '#fef2f2', color: '#c5111a', cursor: 'pointer', display: 'flex', alignItems: 'center', gap: 4, alignSelf: 'flex-end' }}>
                            <span className="material-icons" style={{ fontSize: 14 }}>close</span>
                            Clear
                        </button>
                    )}
                </div>

                {/* Table */}
                <div style={{ overflowX: 'auto', borderRadius: 10, border: '1px solid #e2e8f0', background: '#fff', opacity: loading ? 0.55 : 1, transition: 'opacity 0.15s' }}>
                    <table style={{ width: '100%', minWidth: 1000, borderCollapse: 'collapse', fontSize: 13 }}>
                        <thead>
                            <tr style={{ background: '#f8fafc', borderBottom: '2px solid #e2e8f0' }}>
                                <th style={thStyle}>Ref #</th>
                                <th style={thStyle}>Status</th>
                                <th style={thStyle}>Booking Date</th>
                                <th style={thStyle}>Pickup Time</th>
                                <th style={thStyle}>Client</th>
                                <th style={thStyle}>Mobile</th>
                                <th style={thStyle}>Pickup</th>
                                <th style={thStyle}>Destination</th>
                                <th style={thStyle}>Vehicle</th>
                                <th style={thStyle}>A/C</th>
                                <th style={{ ...thStyle, textAlign: 'right', minWidth: 180 }}>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {loading && bookings.length === 0 ? (
                                <tr><td colSpan="11" style={{ textAlign: 'center', padding: '60px', color: '#94a3b8' }}>
                                    <span className="material-icons" style={{ fontSize: 32, display: 'block', marginBottom: 8 }}>sync</span>Loading...
                                </td></tr>
                            ) : bookings.length === 0 ? (
                                <tr><td colSpan="11" style={{ textAlign: 'center', padding: '60px', color: '#6b7280' }}>
                                    <span className="material-icons" style={{ fontSize: 36, color: '#cbd5e1', display: 'block', marginBottom: 8 }}>search_off</span>
                                    <div style={{ fontWeight: 600 }}>No bookings match your filters</div>
                                    <div style={{ fontSize: 12, color: '#94a3b8', marginTop: 4 }}>Try adjusting the date range or clearing filters</div>
                                </td></tr>
                            ) : bookings.map((b, i) => (
                                <tr key={b.b_id}
                                    style={{ borderBottom: '1px solid #f1f5f9', background: i % 2 === 0 ? '#fff' : '#fafafa' }}
                                    onMouseEnter={e => e.currentTarget.style.background = '#f0f9ff'}
                                    onMouseLeave={e => e.currentTarget.style.background = i % 2 === 0 ? '#fff' : '#fafafa'}
                                >
                                    <td style={{ ...tdStyle, fontWeight: 800, color: '#023149', fontFamily: 'monospace' }}>{formatBookingId(b.b_id)}</td>
                                    <td style={tdStyle}>
                                        <span style={{ display: 'inline-block', padding: '3px 10px', borderRadius: 20, fontSize: 11, fontWeight: 700, whiteSpace: 'nowrap', background: b.assign === '1' ? '#dbeafe' : '#fef9c3', color: b.assign === '1' ? '#1d4ed8' : '#92400e' }}>
                                            {b.assign === '1' ? 'Assigned' : 'Awaiting'}
                                        </span>
                                    </td>
                                    <td style={{ ...tdStyle, color: '#374151', whiteSpace: 'nowrap' }}>{b.b_date}</td>
                                    <td style={{ ...tdStyle, color: '#374151', whiteSpace: 'nowrap' }}>{b.pickup || b.b_time}</td>
                                    <td style={{ ...tdStyle, fontWeight: 600, color: '#023149' }}>{b.b_name}</td>
                                    <td style={{ ...tdStyle, color: '#6b7280', whiteSpace: 'nowrap' }}>{b.m_no}</td>
                                    <td style={{ ...tdStyle, color: '#475569' }}>{b.p_city}</td>
                                    <td style={{ ...tdStyle, color: '#475569' }}>{b.d_place}</td>
                                    <td style={{ ...tdStyle, fontWeight: 600, color: '#023149' }}>{b.v_type}</td>
                                    <td style={{ ...tdStyle, whiteSpace: 'nowrap' }}>
                                        <span style={{ display: 'inline-block', padding: '2px 8px', borderRadius: 4, fontSize: 11, fontWeight: 600, background: b.ac_type === '1' ? '#d1fae5' : '#f1f5f9', color: b.ac_type === '1' ? '#065f46' : '#64748b' }}>
                                            {b.ac_type === '1' ? 'AC' : 'Non-AC'}
                                        </span>
                                    </td>
                                    <td style={{ ...tdStyle, textAlign: 'right' }}>
                                        <div style={{ display: 'flex', gap: 6, justifyContent: 'flex-end' }}>
                                            {b.assign === '1' && (
                                                <button onClick={() => navigate('/trip-closing', { state: { booking: b } })} style={closeBtnStyle}>
                                                    <span className="material-icons" style={{ fontSize: 14 }}>task_alt</span>
                                                    Close
                                                </button>
                                            )}
                                            <button onClick={() => navigate('/cancel-booking', { state: { booking: b } })} style={abortBtnStyle}>
                                                <span className="material-icons" style={{ fontSize: 14 }}>cancel</span>
                                                Abort
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>

                {/* Pagination */}
                {pages > 1 && (
                    <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 8, marginTop: 16 }}>
                        <button onClick={() => setPage(p => Math.max(1, p - 1))} disabled={page === 1} style={pageBtn(false)}>
                            <span className="material-icons" style={{ fontSize: 18 }}>chevron_left</span>
                        </button>
                        {Array.from({ length: pages }, (_, i) => i + 1)
                            .filter(p => p === 1 || p === pages || Math.abs(p - page) <= 2)
                            .reduce((acc, p, idx, arr) => { if (idx > 0 && p - arr[idx - 1] > 1) acc.push('…'); acc.push(p); return acc; }, [])
                            .map((p, i) => p === '…'
                                ? <span key={`d${i}`} style={{ padding: '0 4px', color: '#94a3b8' }}>…</span>
                                : <button key={p} onClick={() => setPage(p)} style={pageBtn(p === page)}>{p}</button>
                            )
                        }
                        <button onClick={() => setPage(p => Math.min(pages, p + 1))} disabled={page === pages} style={pageBtn(false)}>
                            <span className="material-icons" style={{ fontSize: 18 }}>chevron_right</span>
                        </button>
                        <span style={{ fontSize: 12, color: '#6b7280', marginLeft: 8 }}>Page {page} of {pages} · {total} total</span>
                    </div>
                )}

            </div>
        </div>
    );
};

const labelStyle = { fontSize: 11, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.05em' };
const filterBtn = (active, color = '#023149') => ({ height: 36, padding: '0 14px', fontSize: 12, fontWeight: 700, borderRadius: 6, border: '1px solid', background: active ? color : '#f8fafc', color: active ? '#fff' : '#475569', borderColor: active ? color : '#e2e8f0', cursor: 'pointer', display: 'inline-flex', alignItems: 'center', gap: 4 });
const pageBtn = (active) => ({ height: 32, minWidth: 32, padding: '0 10px', fontSize: 13, fontWeight: 700, borderRadius: 6, border: '1px solid', background: active ? '#023149' : '#f8fafc', color: active ? '#fff' : '#475569', borderColor: active ? '#023149' : '#e2e8f0', cursor: 'pointer', display: 'inline-flex', alignItems: 'center', justifyContent: 'center' });
const thStyle = { padding: '12px 14px', textAlign: 'left', fontWeight: 700, fontSize: 11, color: '#64748b', textTransform: 'uppercase', letterSpacing: '0.05em', whiteSpace: 'nowrap' };
const tdStyle = { padding: '13px 14px', verticalAlign: 'middle' };
const closeBtnStyle = { display: 'inline-flex', alignItems: 'center', gap: 4, padding: '5px 12px', fontSize: 12, fontWeight: 600, borderRadius: 6, border: '1px solid #cbd5e1', background: '#fff', color: '#023149', cursor: 'pointer', whiteSpace: 'nowrap' };
const abortBtnStyle = { display: 'inline-flex', alignItems: 'center', gap: 4, padding: '5px 12px', fontSize: 12, fontWeight: 600, borderRadius: 6, border: '1px solid #fecaca', background: '#fef2f2', color: '#c5111a', cursor: 'pointer', whiteSpace: 'nowrap' };

export default DisplayBookings;
