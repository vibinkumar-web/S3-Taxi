import { useState, useEffect, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { fmtDateTime } from '../utils/dateFormat';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'S.No',        key: '_sno' },
    { header: 'B-ID',        key: 'b_id' },
    { header: 'V-Type',      key: 'v_type' },
    { header: 'V-ID',        key: 'v_id' },
    { header: 'Customer',    key: 'customer' },
    { header: 'Pickup City', key: 'picup_place' },
    { header: 'Drop City',   key: 'drop_place' },
    { header: 'Pickup Time', key: 'pickup_time' },
    { header: 'Closing Time',key: 'drop_time' },
    { header: 'Opening KM',  key: 'opening_km' },
    { header: 'Closing KM',  key: 'closing_km' },
    { header: 'Total KMs',   key: 'running_km' },
    { header: 'Amount',      key: 'net_total' },
    { header: 'Paid Amount', key: 'paid_amount' },
];

const Th = ({ label, col, sortConfig, onSort, style = {} }) => (
    <th
        onClick={() => onSort(col)}
        style={{ cursor: 'pointer', userSelect: 'none', whiteSpace: 'nowrap', ...style }}
    >
        {label}
        <span style={{ marginLeft: 4, opacity: sortConfig.key === col ? 1 : 0.3 }}>
            {sortConfig.key === col ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}
        </span>
    </th>
);

const VehicleSeparateReport = () => {
    const { api } = useContext(AuthContext);
    const [vehicles, setVehicles] = useState([]);
    const [reportData, setReportData] = useState(null);
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
            const r = await api.get(`/vehicle_separate_report.php?v_id=${filters.v_id}`);
            setReportData(r.data?.trips !== undefined ? r.data : { trips: [], totals: {} });
        } catch {
            setReportData({ trips: [], totals: {} });
        } finally {
            setLoading(false);
        }
    };

    // Filter: search term + optional date range (client-side)
    const baseData = (reportData?.trips || []).map(t => ({
        ...t,
        b_id: t.b_id || t.bid || '',
        running_km: (parseFloat(t.closing_km) || 0) - (parseFloat(t.opening_km) || 0),
    })).filter(t => {
        const dateStr = (t.pickup_time || t.p_date || '').split(' ')[0];
        const afterFrom = !filters.from_date || dateStr >= filters.from_date;
        const beforeTo  = !filters.to_date   || dateStr <= filters.to_date;
        const matchSearch = !searchTerm ||
            String(t.b_id).toLowerCase().includes(searchTerm.toLowerCase()) ||
            String(t.customer || '').toLowerCase().includes(searchTerm.toLowerCase());
        return afterFrom && beforeTo && matchSearch;
    });

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(baseData);

    const handleExportPDF = () => exportToPDF(
        COLUMNS.filter(c => c.key !== '_sno'),
        sortedData,
        'Vehicle Report',
        `vehicle_report_${filters.v_id}`
    );
    const handleExportExcel = () => exportToExcel(
        COLUMNS.filter(c => c.key !== '_sno'),
        sortedData,
        `vehicle_report_${filters.v_id}`
    );

    return (
        <div style={{ width: '100%', minHeight: '100vh', background: '#fdf6e8', display: 'flex', flexDirection: 'column' }}>
            <div style={{ background: '#023149', width: '100%', padding: '16px 24px' }}>
                <h1 style={{ margin: 0, fontSize: 20, fontWeight: 800, color: '#fff' }}>Vehicle Report</h1>
                <p style={{ margin: '4px 0 0', fontSize: 12, color: 'rgba(255,255,255,0.5)' }}>Vehicle report — trips, amount, customer and city details by vehicle ID</p>
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

                {searched && reportData && (
                    <div style={{ display: 'flex', gap: 24, marginBottom: 8, alignItems: 'center', flexWrap: 'wrap' }}>
                        <div style={{ fontSize: 13, fontWeight: 700, color: '#334155' }}>
                            Total Amount: <span style={{ color: '#16a34a' }}>₹{(reportData.totals?.net_total || 0).toLocaleString()}</span>
                        </div>
                        <div style={{ fontSize: 13, fontWeight: 700, color: '#334155' }}>
                            Total KM: <span style={{ color: '#0f172a' }}>{reportData.totals?.running_km || 0}</span>
                        </div>
                        <div style={{ fontSize: 13, fontWeight: 700, color: '#334155' }}>
                            Paid: <span style={{ color: '#0f172a' }}>₹{(reportData.totals?.paid_amount || 0).toLocaleString()}</span>
                        </div>
                    </div>
                )}

                <ReportToolbar
                    searchTerm={searchTerm}
                    onSearch={setSearchTerm}
                    searchPlaceholder="Search Booking ID or Customer..."
                    page={page}
                    totalPages={totalPages}
                    totalRows={baseData.length}
                    pageSize={pageSize}
                    onPageSizeChange={setPageSize}
                    onPageChange={setPage}
                    onExportPDF={handleExportPDF}
                    onExportExcel={handleExportExcel}
                />

                <div style={{ width: '100%', background: '#fff', borderRadius: 8, border: '1px solid #e8d4aa', boxShadow: '0 1px 4px rgba(2,49,73,.06)', overflowX: 'auto' }}>
                    <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 12, tableLayout: 'auto' }}>
                        <colgroup>
                            <col style={{ width: '40px' }} />
                            <col style={{ width: '60px' }} />
                            <col style={{ width: '60px' }} />
                            <col style={{ width: '50px' }} />
                            <col style={{ width: '110px' }} />
                            <col style={{ width: '100px' }} />
                            <col style={{ width: '100px' }} />
                            <col style={{ width: '130px' }} />
                            <col style={{ width: '130px' }} />
                            <col style={{ width: '90px' }} />
                            <col style={{ width: '90px' }} />
                            <col style={{ width: '70px' }} />
                            <col style={{ width: '80px' }} />
                            <col style={{ width: '80px' }} />
                        </colgroup>
                        <thead style={{ background: '#fdf6e8', position: 'sticky', top: 0, zIndex: 1 }}>
                            <tr>
                                <th style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap' }}>S.No</th>
                                <th onClick={() => handleSort('b_id')} style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>B-ID {sortConfig.key === 'b_id' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('v_type')} style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>V-Type {sortConfig.key === 'v_type' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('v_id')} style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>V-ID {sortConfig.key === 'v_id' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('customer')} style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Customer {sortConfig.key === 'customer' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('picup_place')} style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Pickup City {sortConfig.key === 'picup_place' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('drop_place')} style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Drop City {sortConfig.key === 'drop_place' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('pickup_time')} style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Pickup Time {sortConfig.key === 'pickup_time' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('drop_time')} style={{ padding: '10px 8px', textAlign: 'left', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Closing Time {sortConfig.key === 'drop_time' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('opening_km')} style={{ padding: '10px 8px', textAlign: 'right', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Opening KM {sortConfig.key === 'opening_km' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('closing_km')} style={{ padding: '10px 8px', textAlign: 'right', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Closing KM {sortConfig.key === 'closing_km' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('running_km')} style={{ padding: '10px 8px', textAlign: 'right', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Total KMs {sortConfig.key === 'running_km' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('net_total')} style={{ padding: '10px 8px', textAlign: 'right', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Amount {sortConfig.key === 'net_total' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('paid_amount')} style={{ padding: '10px 8px', textAlign: 'right', fontSize: 11, fontWeight: 700, textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa', whiteSpace: 'nowrap', cursor: 'pointer' }}>Paid Amount {sortConfig.key === 'paid_amount' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr><td colSpan="14" style={{ textAlign: 'center', padding: 40 }}>
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8, color: '#64748b' }}>
                                        <div className="spinner" style={{ width: 28, height: 28, border: '3px solid #e2e8f0', borderTopColor: '#0ea5e9', borderRadius: '50%', animation: 'spin 0.7s linear infinite' }} />
                                        Loading report data...
                                    </div>
                                </td></tr>
                            ) : !searched ? (
                                <tr><td colSpan="14" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>Select a vehicle and click Search.</td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="14" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>No data found for the selected filters.</td></tr>
                            ) : (
                                paginatedData.map((trip, i) => (
                                    <tr key={i} style={{ background: i % 2 === 0 ? '#fff' : '#fafafa' }}>
                                        <td style={{ padding: '9px 8px', fontWeight: 600, color: '#64748b', borderBottom: '1px solid #f1f5f9' }}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={{ padding: '9px 8px', fontWeight: 700, color: '#023149', borderBottom: '1px solid #f1f5f9' }}>{trip.b_id}</td>
                                        <td style={{ padding: '9px 8px', borderBottom: '1px solid #f1f5f9' }}>{trip.v_type}</td>
                                        <td style={{ padding: '9px 8px', fontWeight: 600, borderBottom: '1px solid #f1f5f9' }}>{trip.v_id}</td>
                                        <td style={{ padding: '9px 8px', fontWeight: 600, borderBottom: '1px solid #f1f5f9' }}>{trip.customer}</td>
                                        <td style={{ padding: '9px 8px', borderBottom: '1px solid #f1f5f9' }}>{trip.picup_place}</td>
                                        <td style={{ padding: '9px 8px', borderBottom: '1px solid #f1f5f9' }}>{trip.drop_place}</td>
                                        <td style={{ padding: '9px 8px', whiteSpace: 'nowrap', borderBottom: '1px solid #f1f5f9' }}>{fmtDateTime(trip.pickup_time || trip.p_date)}</td>
                                        <td style={{ padding: '9px 8px', whiteSpace: 'nowrap', borderBottom: '1px solid #f1f5f9' }}>{fmtDateTime(trip.drop_time || trip.d_date)}</td>
                                        <td style={{ padding: '9px 8px', textAlign: 'right', fontWeight: 600, borderBottom: '1px solid #f1f5f9' }}>{trip.opening_km}</td>
                                        <td style={{ padding: '9px 8px', textAlign: 'right', fontWeight: 600, borderBottom: '1px solid #f1f5f9' }}>{trip.closing_km}</td>
                                        <td style={{ padding: '9px 8px', textAlign: 'right', fontWeight: 700, color: '#0f172a', borderBottom: '1px solid #f1f5f9' }}>{trip.running_km}</td>
                                        <td style={{ padding: '9px 8px', textAlign: 'right', fontWeight: 700, color: '#16a34a', borderBottom: '1px solid #f1f5f9' }}>₹{trip.net_total}</td>
                                        <td style={{ padding: '9px 8px', textAlign: 'right', borderBottom: '1px solid #f1f5f9' }}>{trip.paid_amount}</td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                    <div style={{ padding: '10px 16px', fontSize: 12, color: '#64748b', background: '#f8fafc', borderTop: '1px solid #e2e8f0' }}>
                        Showing {paginatedData.length} of {baseData.length} entries
                    </div>
                </div>

                {/* Bottom pagination */}
                {totalPages > 1 && (
                    <ReportToolbar
                        showSearch={false}
                        page={page} totalPages={totalPages} totalRows={baseData.length}
                        pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                        onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                    />
                )}
            </div>

            <style>{`@keyframes spin { to { transform: rotate(360deg); } }`}</style>
        </div>
    );
};

export default VehicleSeparateReport;
