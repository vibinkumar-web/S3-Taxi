import { useState, useEffect, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { fmtDate } from '../utils/dateFormat';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'V-ID',             key: 'v_no' },
    { header: 'Booking ID',       key: 'b_id' },
    { header: 'Prev Closing KM',  key: 'prev_closing_km' },
    { header: 'Next Opening KM',  key: 'curr_opening_km' },
    { header: 'Shortage KM',      key: 'shortage_km' },
    { header: 'Date',             key: 'date' },
];

const ShortageKMReport = () => {
    const { api } = useContext(AuthContext);
    const [vehicles, setVehicles] = useState([]);
    const [reportData, setReportData] = useState([]);
    const [filters, setFilters] = useState({ v_id: '', from_date: '', to_date: '' });
    const [searchTerm, setSearchTerm] = useState('');
    const [loading, setLoading] = useState(false);
    const [searched, setSearched] = useState(false);

    useEffect(() => {
        api.get('/vehicles.php')
            .then(r => setVehicles(Array.isArray(r.data) ? r.data : []))
            .catch(() => {});
    }, [api]);

    const handleFilterChange = e => setFilters({ ...filters, [e.target.name]: e.target.value });

    const handleSearch = async (e) => {
        e.preventDefault();
        setLoading(true);
        setSearched(true);
        try {
            const r = await api.get(`/shortage_km_report.php?v_id=${filters.v_id}`);
            setReportData(Array.isArray(r.data) ? r.data : []);
        } catch {
            setReportData([]);
        } finally {
            setLoading(false);
        }
    };

    const baseData = reportData.filter(trip => {
        const dateStr = (trip.date || '').split(' ')[0];
        const afterFrom = !filters.from_date || dateStr >= filters.from_date;
        const beforeTo  = !filters.to_date   || dateStr <= filters.to_date;
        const matchSearch = !searchTerm ||
            String(trip.b_id || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
            String(trip.v_no || '').toLowerCase().includes(searchTerm.toLowerCase());
        return afterFrom && beforeTo && matchSearch;
    });

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(baseData);

    const totalShortage = baseData.reduce((s, r) => s + (parseFloat(r.shortage_km) || 0), 0);

    const handleExportPDF = () => exportToPDF(COLUMNS, sortedData, 'Shortage KM Report', `shortage_km_${filters.v_id}`);
    const handleExportExcel = () => exportToExcel(COLUMNS, sortedData, `shortage_km_${filters.v_id}`);

    const thStyle = (align = 'left') => ({
        padding: '10px 10px', textAlign: align, fontSize: 11, fontWeight: 700,
        textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa',
        whiteSpace: 'nowrap', cursor: 'pointer', background: '#fdf6e8',
    });

    return (
        <div style={{ width: '100%', minHeight: '100vh', background: '#fdf6e8', display: 'flex', flexDirection: 'column' }}>
            <div style={{ background: '#023149', width: '100%', padding: '16px 24px' }}>
                <h1 style={{ margin: 0, fontSize: 20, fontWeight: 800, color: '#fff' }}>Shortage KM Report</h1>
                <p style={{ margin: '4px 0 0', fontSize: 12, color: 'rgba(255,255,255,0.5)' }}>Odometer gap analysis — difference between trip closing and next trip opening KM</p>
            </div>

            <div style={{ width: '100%', padding: '16px 16px 40px', boxSizing: 'border-box', flex: 1 }}>
                <form onSubmit={handleSearch} style={{ display: 'flex', gap: 12, alignItems: 'flex-end', flexWrap: 'wrap', background: '#e2e8f0', padding: 16, marginBottom: 16, borderRadius: 8 }}>
                    <div className="form-field" style={{ margin: 0, minWidth: 200 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>Vehicle ID</label>
                        <select name="v_id" value={filters.v_id} onChange={handleFilterChange} required style={{ height: 38, fontWeight: 600 }}>
                            <option value="">Select Vehicle ID</option>
                            {vehicles.map(v => <option key={v.v_id} value={v.v_id}>{v.v_id}</option>)}
                        </select>
                    </div>
                    <div className="form-field" style={{ margin: 0, minWidth: 150 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>From Date</label>
                        <input type="date" name="from_date" value={filters.from_date} onChange={handleFilterChange} style={{ height: 38, fontWeight: 600 }} />
                    </div>
                    <div className="form-field" style={{ margin: 0, minWidth: 150 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>To Date</label>
                        <input type="date" name="to_date" value={filters.to_date} onChange={handleFilterChange} style={{ height: 38, fontWeight: 600 }} />
                    </div>
                    <button type="submit" disabled={loading} className="btn-primary" style={{ height: 38, padding: '0 24px', background: '#0ea5e9' }}>
                        {loading ? 'Loading...' : 'Search'}
                    </button>
                    {(filters.from_date || filters.to_date) && (
                        <button type="button" onClick={() => setFilters(f => ({ ...f, from_date: '', to_date: '' }))} style={{ height: 38, padding: '0 16px', background: '#f1f5f9', border: '1px solid #cbd5e1', borderRadius: 4, fontSize: 12, fontWeight: 600, color: '#64748b', cursor: 'pointer' }}>Clear Dates</button>
                    )}
                </form>

                {searched && baseData.length > 0 && (
                    <div style={{ marginBottom: 8, fontSize: 13, fontWeight: 700, color: '#334155' }}>
                        Total Shortage KM: <span style={{ color: '#dc2626' }}>{totalShortage.toFixed(1)}</span>
                    </div>
                )}

                <ReportToolbar
                    searchTerm={searchTerm} onSearch={setSearchTerm}
                    searchPlaceholder="Search Booking ID or Vehicle..."
                    page={page} totalPages={totalPages} totalRows={baseData.length}
                    pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                    onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                />

                <div style={{ width: '100%', background: '#fff', borderRadius: 8, border: '1px solid #e8d4aa', boxShadow: '0 1px 4px rgba(2,49,73,.06)', overflowX: 'auto', marginTop: 8 }}>
                    <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 12, tableLayout: 'auto' }}>
                        <thead style={{ position: 'sticky', top: 0, zIndex: 1 }}>
                            <tr>
                                <th style={thStyle()}>S.No</th>
                                <th onClick={() => handleSort('v_no')} style={thStyle()}>V-ID {sortConfig.key === 'v_no' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('b_id')} style={thStyle()}>Booking ID {sortConfig.key === 'b_id' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('prev_closing_km')} style={thStyle('right')}>Prev Closing KM {sortConfig.key === 'prev_closing_km' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('curr_opening_km')} style={thStyle('right')}>Next Opening KM {sortConfig.key === 'curr_opening_km' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('shortage_km')} style={{ ...thStyle('right'), color: '#b91c1c' }}>Shortage KM {sortConfig.key === 'shortage_km' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('date')} style={thStyle()}>Date {sortConfig.key === 'date' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 40 }}>
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8, color: '#64748b' }}>
                                        <div style={{ width: 28, height: 28, border: '3px solid #e2e8f0', borderTopColor: '#0ea5e9', borderRadius: '50%', animation: 'spin 0.7s linear infinite' }} />
                                        Loading gap analysis...
                                    </div>
                                </td></tr>
                            ) : !searched ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>Select a vehicle and click Search.</td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>No discrepancies found for this vehicle.</td></tr>
                            ) : (
                                paginatedData.map((gap, i) => (
                                    <tr key={i} style={{ background: i % 2 === 0 ? '#fff' : '#fafafa' }}>
                                        <td style={{ padding: '9px 10px', fontWeight: 600, color: '#64748b', borderBottom: '1px solid #f1f5f9' }}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={{ padding: '9px 10px', fontWeight: 700, color: '#023149', borderBottom: '1px solid #f1f5f9' }}>{gap.v_no}</td>
                                        <td style={{ padding: '9px 10px', fontWeight: 600, fontFamily: 'monospace', borderBottom: '1px solid #f1f5f9' }}>#{gap.b_id}</td>
                                        <td style={{ padding: '9px 10px', textAlign: 'right', fontWeight: 600, color: '#64748b', borderBottom: '1px solid #f1f5f9' }}>{gap.prev_closing_km}</td>
                                        <td style={{ padding: '9px 10px', textAlign: 'right', fontWeight: 600, color: '#64748b', borderBottom: '1px solid #f1f5f9' }}>{gap.curr_opening_km}</td>
                                        <td style={{ padding: '9px 10px', textAlign: 'right', fontWeight: 800, color: '#dc2626', borderBottom: '1px solid #f1f5f9' }}>{gap.shortage_km}</td>
                                        <td style={{ padding: '9px 10px', whiteSpace: 'nowrap', color: '#475569', borderBottom: '1px solid #f1f5f9' }}>{fmtDate(gap.date)} {gap.time}</td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                    <div style={{ padding: '10px 16px', fontSize: 12, color: '#64748b', background: '#f8fafc', borderTop: '1px solid #e2e8f0' }}>
                        Showing {paginatedData.length} of {baseData.length} entries
                    </div>
                </div>

                {totalPages > 1 && (
                    <ReportToolbar showSearch={false} page={page} totalPages={totalPages} totalRows={baseData.length}
                        pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                        onExportPDF={handleExportPDF} onExportExcel={handleExportExcel} />
                )}
            </div>
            <style>{`@keyframes spin { to { transform: rotate(360deg); } }`}</style>
        </div>
    );
};

export default ShortageKMReport;
