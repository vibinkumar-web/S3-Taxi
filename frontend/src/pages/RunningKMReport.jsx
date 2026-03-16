import { useState, useEffect, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'V-ID',        key: 'v_id' },
    { header: 'Opening KM',  key: 'opening_km' },
    { header: 'Closing KM',  key: 'closing_km' },
    { header: 'Running KM',  key: 'running_km' },
    { header: 'Diff KM',     key: 'diff_km' },
];

const Th = ({ label, col, sortConfig, onSort, style = {} }) => (
    <th onClick={() => onSort(col)} style={{ cursor: 'pointer', userSelect: 'none', whiteSpace: 'nowrap', ...style }}>
        {label}
        <span style={{ marginLeft: 4, opacity: sortConfig.key === col ? 1 : 0.3 }}>
            {sortConfig.key === col ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}
        </span>
    </th>
);

const RunningKMReport = () => {
    const { api } = useContext(AuthContext);
    const [vehicles, setVehicles] = useState([]);
    const [reportData, setReportData] = useState([]);
    const [filters, setFilters] = useState({ v_id: '', from_date: '', to_date: '' });
    const [searchTerm, setSearchTerm] = useState('');
    const [loading, setLoading] = useState(false);
    const [searched, setSearched] = useState(false);

    useEffect(() => {
        const today = new Date().toISOString().split('T')[0];
        const thirtyDaysAgo = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
        setFilters(prev => ({ ...prev, from_date: thirtyDaysAgo, to_date: today }));
        api.get('/running_km_report.php?list=true')
            .then(r => setVehicles(Array.isArray(r.data) ? r.data : []))
            .catch(() => {});
    }, [api]);

    const handleFilterChange = e => setFilters({ ...filters, [e.target.name]: e.target.value });

    const handleSearch = async (e) => {
        e.preventDefault();
        setLoading(true);
        setSearched(true);
        try {
            const r = await api.get(`/running_km_report.php?v_id=${filters.v_id}&from_date=${filters.from_date}&to_date=${filters.to_date}`);
            setReportData(Array.isArray(r.data) ? r.data : []);
        } catch {
            setReportData([]);
        } finally {
            setLoading(false);
        }
    };

    const baseData = reportData.filter(rec =>
        !searchTerm || String(rec.v_id || '').toLowerCase().includes(searchTerm.toLowerCase())
    );

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(baseData);

    const handleExportPDF = () => exportToPDF(COLUMNS, sortedData, 'Running KM Report', `running_km_${filters.from_date}`);
    const handleExportExcel = () => exportToExcel(COLUMNS, sortedData, `running_km_${filters.from_date}`);

    const totalRunning = baseData.reduce((s, r) => s + (parseFloat(r.running_km) || 0), 0);
    const totalDiff = baseData.reduce((s, r) => s + (parseFloat(r.diff_km) || 0), 0);

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div><div>
                    <h1>Running KM Report</h1>
                    <p>Vehicle odometer — opening, closing, running and difference KMs by date</p>
                </div></div>
            </div>

            <div className="page-body">
                <form onSubmit={handleSearch} style={{ display: 'grid', gridTemplateColumns: 'minmax(240px, 1.5fr) 1fr 1fr auto', gap: 24, alignItems: 'flex-end', background: '#e2e8f0', padding: 16, marginBottom: 16 }}>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>Vehicle ID</label>
                        <select name="v_id" value={filters.v_id} onChange={handleFilterChange} style={{ height: 38, fontWeight: 600 }}>
                            <option value="">All Vehicles</option>
                            <option value="All">All Associated Vehicles</option>
                            {vehicles.map((v, i) => <option key={i} value={v}>{v}</option>)}
                        </select>
                    </div>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>From</label>
                        <input type="date" name="from_date" value={filters.from_date} onChange={handleFilterChange} required style={{ height: 38, fontWeight: 600 }} />
                    </div>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>To</label>
                        <input type="date" name="to_date" value={filters.to_date} onChange={handleFilterChange} required style={{ height: 38, fontWeight: 600 }} />
                    </div>
                    <button type="submit" disabled={loading} className="btn-primary" style={{ height: 38, padding: '0 24px', background: '#0ea5e9' }}>
                        {loading ? 'Loading...' : 'Search'}
                    </button>
                </form>

                {searched && baseData.length > 0 && (
                    <div style={{ display: 'flex', gap: 24, marginBottom: 8, fontSize: 13 }}>
                        <span style={{ fontWeight: 700, color: '#334155' }}>Total Running KM: <span style={{ color: '#0f172a' }}>{totalRunning.toFixed(1)}</span></span>
                        <span style={{ fontWeight: 700, color: '#334155' }}>Total Diff KM: <span style={{ color: totalDiff > 0 ? '#b91c1c' : '#15803d' }}>{totalDiff.toFixed(1)}</span></span>
                    </div>
                )}

                <ReportToolbar
                    searchTerm={searchTerm} onSearch={setSearchTerm}
                    searchPlaceholder="Search Vehicle ID..."
                    page={page} totalPages={totalPages} totalRows={baseData.length}
                    pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                    onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                />

                <div className="table-wrap">
                    <table style={{ margin: 0, fontSize: 12 }}>
                        <thead style={{ background: '#f8fafc' }}>
                            <tr>
                                <th style={{ width: 40, textAlign: 'center' }}>#</th>
                                <Th label="V-ID"       col="v_id"        sortConfig={sortConfig} onSort={handleSort} />
                                <Th label="Opening KM" col="opening_km"  sortConfig={sortConfig} onSort={handleSort} style={{ textAlign: 'right' }} />
                                <Th label="Closing KM" col="closing_km"  sortConfig={sortConfig} onSort={handleSort} style={{ textAlign: 'right' }} />
                                <Th label="Running KM" col="running_km"  sortConfig={sortConfig} onSort={handleSort} style={{ textAlign: 'right' }} />
                                <Th label="Diff KM"    col="diff_km"     sortConfig={sortConfig} onSort={handleSort} style={{ textAlign: 'right' }} />
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr><td colSpan="6" style={{ textAlign: 'center', padding: 40 }}>
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8, color: '#64748b' }}>
                                        <div style={{ width: 28, height: 28, border: '3px solid #e2e8f0', borderTopColor: '#0ea5e9', borderRadius: '50%', animation: 'spin 0.7s linear infinite' }} />
                                        Loading odometer records...
                                    </div>
                                </td></tr>
                            ) : !searched ? (
                                <tr><td colSpan="6" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>Select a date range and click Search.</td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="6" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>No odometer records found for this timeframe.</td></tr>
                            ) : (
                                paginatedData.map((record, i) => (
                                    <tr key={i}>
                                        <td style={{ textAlign: 'center', color: '#64748b', fontWeight: 600 }}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={{ fontWeight: 800, color: '#023149', fontSize: 13 }}>{record.v_id}</td>
                                        <td style={{ textAlign: 'right', fontWeight: 600 }}>{record.opening_km}</td>
                                        <td style={{ textAlign: 'right', fontWeight: 600 }}>{record.closing_km}</td>
                                        <td style={{ textAlign: 'right', fontWeight: 800 }}>{parseFloat(record.running_km).toFixed(1)}</td>
                                        <td style={{ textAlign: 'right', fontWeight: 800, color: parseFloat(record.diff_km) > 0 ? '#b91c1c' : '#15803d' }}>
                                            {parseFloat(record.diff_km).toFixed(1)}
                                        </td>
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

export default RunningKMReport;
