import { useState, useEffect, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { fmtDate } from '../utils/dateFormat';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'Date',           key: 'date_refused' },
    { header: 'Booking ID',     key: 'b_id' },
    { header: 'Vehicle ID',     key: 'v_id' },
    { header: 'Refusal Reason', key: 'reason_for' },
    { header: 'Pickup',         key: 'pickup' },
    { header: 'Drop Place',     key: 'drop_place' },
];

const Th = ({ label, col, sortConfig, onSort, style = {} }) => (
    <th onClick={() => onSort(col)} style={{ cursor: 'pointer', userSelect: 'none', whiteSpace: 'nowrap', ...style }}>
        {label}
        <span style={{ marginLeft: 4, opacity: sortConfig.key === col ? 1 : 0.3 }}>
            {sortConfig.key === col ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}
        </span>
    </th>
);

const RefusalReport = () => {
    const { api } = useContext(AuthContext);
    const [vehicleIds, setVehicleIds] = useState([]);
    const [reportData, setReportData] = useState([]);
    const [filters, setFilters] = useState({ v_id: '', from_date: '', to_date: '' });
    const [searchTerm, setSearchTerm] = useState('');
    const [loading, setLoading] = useState(false);
    const [searched, setSearched] = useState(false);

    useEffect(() => {
        api.get('/refusal_report.php?list=true')
            .then(r => {
                const d = r.data;
                setVehicleIds(Array.isArray(d) ? d : Array.isArray(d?.data) ? d.data : []);
            })
            .catch(() => setVehicleIds([]));
    }, [api]);

    const handleFilterChange = e => setFilters({ ...filters, [e.target.name]: e.target.value });

    const handleSearch = async (e) => {
        e.preventDefault();
        setLoading(true);
        setSearched(true);
        try {
            const r = await api.get(`/refusal_report.php?v_id=${filters.v_id}&from_date=${filters.from_date}&to_date=${filters.to_date}`);
            setReportData(Array.isArray(r.data) ? r.data : []);
        } catch {
            setReportData([]);
        } finally {
            setLoading(false);
        }
    };

    const baseData = reportData.filter(rec =>
        !searchTerm ||
        String(rec.b_id || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(rec.v_id || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(rec.reason_for || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(rec.pickup || '').toLowerCase().includes(searchTerm.toLowerCase())
    );

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(baseData);

    const handleExportPDF = () => exportToPDF(COLUMNS, sortedData, `Refusal Report (${filters.from_date} to ${filters.to_date})`, `refusal_report_${filters.from_date}`);
    const handleExportExcel = () => exportToExcel(COLUMNS, sortedData, `refusal_report_${filters.from_date}`);

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div><div>
                    <h1>Refusal Report</h1>
                    <p>Booking refusals by vehicle — with reason, pickup and drop location details</p>
                </div></div>
            </div>

            <div className="page-body">
                <form onSubmit={handleSearch} style={{ display: 'grid', gridTemplateColumns: 'minmax(240px, 1.5fr) 1fr 1fr auto', gap: 24, alignItems: 'flex-end', background: '#fff', border: '1px solid #e2e8f0', borderRadius: 8, padding: 24, marginBottom: 24, boxShadow: '0 1px 3px rgba(0,0,0,.07)' }}>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.05em', marginBottom: 8 }}>Vehicle ID</label>
                        <div className="input-with-icon">
                            <span className="material-icons" style={{ color: '#023149' }}>directions_car</span>
                            <select name="v_id" value={filters.v_id} onChange={handleFilterChange} style={{ height: 48, fontWeight: 700 }}>
                                <option value="">All Vehicles</option>
                                <option value="All">All</option>
                                {vehicleIds.map((id, i) => <option key={id || i} value={id}>{id}</option>)}
                            </select>
                        </div>
                    </div>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.05em', marginBottom: 8 }}>From Date</label>
                        <input type="date" name="from_date" value={filters.from_date} onChange={handleFilterChange} required style={{ height: 48, fontWeight: 600, color: '#0f172a' }} />
                    </div>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.05em', marginBottom: 8 }}>To Date</label>
                        <input type="date" name="to_date" value={filters.to_date} onChange={handleFilterChange} required style={{ height: 48, fontWeight: 600, color: '#0f172a' }} />
                    </div>
                    <button type="submit" disabled={loading} className="btn-primary"
                        style={{ height: 48, padding: '0 32px', background: '#c5111a', fontSize: 15 }}>
                        {loading ? 'Loading...' : 'Search'}
                    </button>
                </form>

                <ReportToolbar
                    searchTerm={searchTerm} onSearch={setSearchTerm}
                    searchPlaceholder="Search booking ID, vehicle, reason or pickup..."
                    page={page} totalPages={totalPages} totalRows={baseData.length}
                    pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                    onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                />

                <div className="table-wrap" style={{ background: '#fff', borderRadius: 8, border: '1px solid #e2e8f0', boxShadow: '0 1px 3px rgba(0,0,0,.07)', overflow: 'hidden' }}>
                    <table style={{ margin: 0 }}>
                        <thead style={{ background: '#f8fafc' }}>
                            <tr>
                                <th style={{ padding: '14px 20px' }}>#</th>
                                <Th label="Date"           col="date_refused" sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Booking ID"     col="b_id"         sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Vehicle ID"     col="v_id"         sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Refusal Reason" col="reason_for"   sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px', minWidth: 200 }} />
                                <Th label="Pickup"         col="pickup"       sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Drop Place"     col="drop_place"   sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60 }}>
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8, color: '#64748b' }}>
                                        <div style={{ width: 32, height: 32, border: '3px solid #e2e8f0', borderTopColor: '#c5111a', borderRadius: '50%', animation: 'spin 0.7s linear infinite' }} />
                                        Loading refusal records...
                                    </div>
                                </td></tr>
                            ) : !searched ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60, color: '#94a3b8' }}>Select a vehicle and date range, then click Search.</td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60, color: '#94a3b8' }}>No refusals found for the selected parameters.</td></tr>
                            ) : (
                                paginatedData.map((record, i) => (
                                    <tr key={i} style={{ borderBottom: '1px solid #f1f5f9' }}>
                                        <td style={{ padding: '12px 20px', color: '#64748b', fontWeight: 600 }}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={{ padding: '12px 20px', fontWeight: 600, color: '#475569' }}>{fmtDate(record.date_refused)}</td>
                                        <td style={{ padding: '12px 20px', fontWeight: 800, color: '#023149', fontFamily: 'monospace' }}>#{record.b_id}</td>
                                        <td style={{ padding: '12px 20px', fontWeight: 800, color: '#023149' }}>{record.v_id}</td>
                                        <td style={{ padding: '12px 20px' }}>
                                            <div style={{ background: '#fef2f2', border: '1px solid #fecaca', color: '#b91c1c', padding: '4px 10px', borderRadius: 6, fontSize: 13, fontWeight: 600, display: 'inline-block' }}>
                                                {record.reason_for}
                                            </div>
                                        </td>
                                        <td style={{ padding: '12px 20px', color: '#475569' }}>{record.pickup}</td>
                                        <td style={{ padding: '12px 20px', color: '#475569' }}>{record.drop_place}</td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                    <div style={{ padding: '10px 20px', fontSize: 12, color: '#64748b', background: '#f8fafc', borderTop: '1px solid #e2e8f0' }}>
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

export default RefusalReport;
