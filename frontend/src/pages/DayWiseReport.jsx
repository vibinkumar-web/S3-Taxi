import { useState, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { fmtDate } from '../utils/dateFormat';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'Date',           key: 'date' },
    { header: 'Trip ID',        key: 'trip_id' },
    { header: 'Vehicle No',     key: 'vechile_no' },
    { header: 'Company',        key: 'company_name' },
    { header: 'Passenger',      key: 'guest_name' },
    { header: 'Amount (₹)',     key: 'total_amt' },
];

const Th = ({ label, col, sortConfig, onSort, style = {} }) => (
    <th onClick={() => onSort(col)} style={{ cursor: 'pointer', userSelect: 'none', whiteSpace: 'nowrap', ...style }}>
        {label}
        <span style={{ marginLeft: 4, opacity: sortConfig.key === col ? 1 : 0.3 }}>
            {sortConfig.key === col ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}
        </span>
    </th>
);

const DayWiseReport = () => {
    const { api } = useContext(AuthContext);
    const [reportData, setReportData] = useState([]);
    const [filters, setFilters] = useState({ from_date: '', to_date: '' });
    const [searchTerm, setSearchTerm] = useState('');
    const [loading, setLoading] = useState(false);
    const [searched, setSearched] = useState(false);

    const handleFilterChange = e => setFilters({ ...filters, [e.target.name]: e.target.value });

    const handleSearch = async (e) => {
        e.preventDefault();
        setLoading(true);
        setSearched(true);
        try {
            const r = await api.get(`/day_wise_report.php?from_date=${filters.from_date}&to_date=${filters.to_date}`);
            setReportData(Array.isArray(r.data) ? r.data : []);
        } catch {
            setReportData([]);
        } finally {
            setLoading(false);
        }
    };

    const baseData = reportData.filter(rec =>
        !searchTerm ||
        String(rec.guest_name || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(rec.company_name || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(rec.vechile_no || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(rec.trip_id || '').toLowerCase().includes(searchTerm.toLowerCase())
    );

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(baseData);

    const totalRevenue = baseData.reduce((s, r) => s + (parseFloat(r.total_amt) || 0), 0);

    const handleExportPDF = () => exportToPDF(COLUMNS, sortedData, `Day Wise Report (${filters.from_date} to ${filters.to_date})`, `day_wise_${filters.from_date}`);
    const handleExportExcel = () => exportToExcel(COLUMNS, sortedData, `day_wise_${filters.from_date}`);

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div><div>
                    <h1>Day Wise Report</h1>
                    <p>Daily revenue and trip digest — vehicle, company, passenger, and amount by date</p>
                </div></div>
            </div>

            <div className="page-body">
                <form onSubmit={handleSearch} style={{ display: 'grid', gridTemplateColumns: '1fr 1fr auto', gap: 24, alignItems: 'flex-end', background: '#fff', border: '1px solid #e2e8f0', borderRadius: 8, padding: 24, marginBottom: 24, boxShadow: '0 1px 3px rgba(0,0,0,.07)' }}>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.05em', marginBottom: 8 }}>From Date</label>
                        <input type="date" name="from_date" value={filters.from_date} onChange={handleFilterChange} required style={{ height: 48, fontWeight: 600, color: '#0f172a' }} />
                    </div>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.05em', marginBottom: 8 }}>To Date</label>
                        <input type="date" name="to_date" value={filters.to_date} onChange={handleFilterChange} required style={{ height: 48, fontWeight: 600, color: '#0f172a' }} />
                    </div>
                    <button type="submit" disabled={loading} className="btn-primary" style={{ height: 48, padding: '0 32px', fontSize: 15 }}>
                        {loading ? 'Loading...' : 'Search'}
                    </button>
                </form>

                {searched && baseData.length > 0 && (
                    <div style={{ display: 'flex', justifyContent: 'flex-end', marginBottom: 8 }}>
                        <div style={{ background: '#f0fdf4', padding: '12px 24px', borderRadius: 8, border: '1px solid #bbf7d0', fontSize: 15, fontWeight: 800, color: '#14532d' }}>
                            Total Revenue: ₹{totalRevenue.toLocaleString(undefined, { minimumFractionDigits: 2 })}
                        </div>
                    </div>
                )}

                <ReportToolbar
                    searchTerm={searchTerm} onSearch={setSearchTerm}
                    searchPlaceholder="Search passenger, company, vehicle..."
                    page={page} totalPages={totalPages} totalRows={baseData.length}
                    pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                    onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                />

                <div className="table-wrap" style={{ background: '#fff', borderRadius: 8, border: '1px solid #e2e8f0', boxShadow: '0 1px 3px rgba(0,0,0,.07)', overflow: 'hidden' }}>
                    <table style={{ margin: 0 }}>
                        <thead style={{ background: '#f8fafc' }}>
                            <tr>
                                <th style={{ padding: '14px 20px' }}>#</th>
                                <Th label="Date"         col="date"         sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Trip ID"      col="trip_id"      sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Vehicle No"   col="vechile_no"   sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Company"      col="company_name" sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Passenger"    col="guest_name"   sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Amount (₹)"  col="total_amt"    sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px', textAlign: 'right' }} />
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60 }}>
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8, color: '#64748b' }}>
                                        <div style={{ width: 32, height: 32, border: '3px solid #e2e8f0', borderTopColor: '#0ea5e9', borderRadius: '50%', animation: 'spin 0.7s linear infinite' }} />
                                        Loading records...
                                    </div>
                                </td></tr>
                            ) : !searched ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60, color: '#94a3b8' }}>Enter a date range and click Search to view records.</td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60, color: '#94a3b8' }}>No records found for this period.</td></tr>
                            ) : (
                                paginatedData.map((record, i) => (
                                    <tr key={i} style={{ borderBottom: '1px solid #f1f5f9' }}>
                                        <td style={{ padding: '12px 20px', color: '#64748b', fontWeight: 600 }}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={{ padding: '12px 20px', fontWeight: 600, color: '#475569' }}>{fmtDate(record.date)}</td>
                                        <td style={{ padding: '12px 20px', color: '#023149', fontFamily: 'monospace', fontWeight: 800 }}>#{record.trip_id}</td>
                                        <td style={{ padding: '12px 20px', fontWeight: 700, color: '#334155' }}>{record.vechile_no}</td>
                                        <td style={{ padding: '12px 20px', color: '#475569' }}>{record.company_name}</td>
                                        <td style={{ padding: '12px 20px', color: '#475569' }}>{record.guest_name}</td>
                                        <td style={{ padding: '12px 20px', textAlign: 'right', fontWeight: 800, color: '#15803d' }}>
                                            ₹{parseFloat(record.total_amt).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}
                                        </td>
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

export default DayWiseReport;
