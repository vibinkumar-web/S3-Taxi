import { useState, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'Date',         key: 'b_date' },
    { header: 'Booking ID',   key: 'b_id' },
    { header: 'Customer',     key: 'customer_name' },
    { header: 'Mobile',       key: 'mobile' },
    { header: 'Cancel Reason',key: 'reason' },
    { header: 'Staff',        key: 'staff_name' },
];

const Th = ({ label, col, sortConfig, onSort, style = {} }) => (
    <th onClick={() => onSort(col)} style={{ cursor: 'pointer', userSelect: 'none', whiteSpace: 'nowrap', ...style }}>
        {label}
        <span style={{ marginLeft: 4, opacity: sortConfig.key === col ? 1 : 0.3 }}>
            {sortConfig.key === col ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}
        </span>
    </th>
);

const CancelReport = () => {
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
            const r = await api.get(`/cancel_report.php?from_date=${filters.from_date}&to_date=${filters.to_date}`);
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
        String(rec.customer_name || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(rec.reason || '').toLowerCase().includes(searchTerm.toLowerCase())
    );

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(baseData);

    const handleExportPDF = () => exportToPDF(COLUMNS, sortedData, `Cancellation Report (${filters.from_date} to ${filters.to_date})`, `cancel_report_${filters.from_date}`);
    const handleExportExcel = () => exportToExcel(COLUMNS, sortedData, `cancel_report_${filters.from_date}`);

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div><div>
                    <h1>Cancellation Report</h1>
                    <p>Cancelled bookings with reason and staff details</p>
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
                    <button type="submit" disabled={loading} className="btn-primary"
                        style={{ height: 48, padding: '0 32px', background: '#c5111a', fontSize: 15 }}>
                        {loading ? 'Loading...' : 'Search'}
                    </button>
                </form>

                <ReportToolbar
                    searchTerm={searchTerm} onSearch={setSearchTerm}
                    searchPlaceholder="Search booking ID, customer or reason..."
                    page={page} totalPages={totalPages} totalRows={baseData.length}
                    pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                    onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                />

                <div className="table-wrap" style={{ background: '#fff', borderRadius: 8, border: '1px solid #e2e8f0', boxShadow: '0 1px 3px rgba(0,0,0,.07)', overflow: 'hidden' }}>
                    <table style={{ margin: 0 }}>
                        <thead style={{ background: '#f8fafc' }}>
                            <tr>
                                <th style={{ padding: '14px 20px' }}>#</th>
                                <Th label="Date"         col="b_date"        sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Booking ID"   col="b_id"          sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Customer"     col="customer_name" sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Mobile"       col="mobile"        sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                                <Th label="Cancel Reason" col="reason"       sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px', minWidth: 200 }} />
                                <Th label="Staff"        col="staff_name"    sortConfig={sortConfig} onSort={handleSort} style={{ padding: '14px 20px' }} />
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60 }}>
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8, color: '#64748b' }}>
                                        <div style={{ width: 32, height: 32, border: '3px solid #e2e8f0', borderTopColor: '#c5111a', borderRadius: '50%', animation: 'spin 0.7s linear infinite' }} />
                                        Loading cancellation records...
                                    </div>
                                </td></tr>
                            ) : !searched ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60, color: '#94a3b8' }}>Enter a date range and click Search.</td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="7" style={{ textAlign: 'center', padding: 60, color: '#94a3b8' }}>No cancellations found for this period.</td></tr>
                            ) : (
                                paginatedData.map((record, i) => (
                                    <tr key={i} style={{ borderBottom: '1px solid #f1f5f9' }}>
                                        <td style={{ padding: '12px 20px', color: '#64748b', fontWeight: 600 }}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={{ padding: '12px 20px', fontWeight: 600, color: '#475569' }}>{record.b_date}</td>
                                        <td style={{ padding: '12px 20px', fontWeight: 800, color: '#023149', fontFamily: 'monospace' }}>#{record.b_id}</td>
                                        <td style={{ padding: '12px 20px', fontWeight: 700, color: '#334155' }}>{record.customer_name}</td>
                                        <td style={{ padding: '12px 20px', color: '#475569' }}>{record.mobile}</td>
                                        <td style={{ padding: '12px 20px' }}>
                                            <div style={{ background: '#fef2f2', border: '1px solid #fecaca', color: '#b91c1c', padding: '4px 10px', borderRadius: 6, fontSize: 13, fontWeight: 600, display: 'inline-block' }}>
                                                {record.reason}
                                            </div>
                                        </td>
                                        <td style={{ padding: '12px 20px', fontStyle: 'italic', color: '#64748b' }}>{record.staff_name}</td>
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

export default CancelReport;
