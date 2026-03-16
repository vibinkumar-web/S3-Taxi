import { useState, useEffect, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { fmtDate } from '../utils/dateFormat';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'Trip ID',      key: 'trip_id' },
    { header: 'Guest Name',   key: 'guest_name' },
    { header: 'Date',         key: 'date' },
    { header: 'Pickup City',  key: 'pickup_city' },
    { header: 'Drop City',    key: 'drop_city' },
    { header: 'Vehicle Type', key: 'v_type' },
    { header: 'Vehicle No',   key: 'vechile_no' },
    { header: 'Total KMs',    key: 'total_km' },
    { header: 'Amount',       key: 'total_amt' },
];

const Th = ({ label, col, sortConfig, onSort, style = {} }) => (
    <th onClick={() => onSort(col)} style={{ cursor: 'pointer', userSelect: 'none', whiteSpace: 'nowrap', ...style }}>
        {label}
        <span style={{ marginLeft: 4, opacity: sortConfig.key === col ? 1 : 0.3 }}>
            {sortConfig.key === col ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}
        </span>
    </th>
);

const CompanyReport = () => {
    const { api } = useContext(AuthContext);
    const [companies, setCompanies] = useState([]);
    const [reportData, setReportData] = useState([]);
    const [filters, setFilters] = useState({ company: '', from_date: '', to_date: '' });
    const [searchTerm, setSearchTerm] = useState('');
    const [loading, setLoading] = useState(false);
    const [searched, setSearched] = useState(false);

    useEffect(() => {
        const today = new Date().toISOString().split('T')[0];
        const thirtyDaysAgo = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
        setFilters(prev => ({ ...prev, from_date: thirtyDaysAgo, to_date: today }));
        api.get('/company_report.php?list=true')
            .then(r => setCompanies(Array.isArray(r.data) ? r.data : []))
            .catch(() => {});
    }, [api]);

    const handleFilterChange = e => setFilters({ ...filters, [e.target.name]: e.target.value });

    const handleSearch = async (e) => {
        e.preventDefault();
        setLoading(true);
        setSearched(true);
        try {
            const r = await api.get(`/company_report.php?company=${filters.company}&from_date=${filters.from_date}&to_date=${filters.to_date}`);
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
        String(rec.trip_id || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
        String(rec.vechile_no || '').toLowerCase().includes(searchTerm.toLowerCase())
    );

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(baseData);

    const totalAmount = baseData.reduce((s, r) => s + (parseFloat(r.total_amt) || 0), 0);

    const handleExportPDF = () => exportToPDF(COLUMNS, sortedData, `Company Report — ${filters.company || 'All'}`, `company_report_${filters.from_date}`);
    const handleExportExcel = () => exportToExcel(COLUMNS, sortedData, `company_report_${filters.from_date}`);

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div><div>
                    <h1>Company Wise Report</h1>
                    <p>Trip details grouped by corporate client, with date filtering and export</p>
                </div></div>
            </div>

            <div className="page-body">
                <form onSubmit={handleSearch} style={{ display: 'grid', gridTemplateColumns: 'minmax(240px, 1.5fr) 1fr 1fr auto', gap: 24, alignItems: 'flex-end', background: '#e2e8f0', padding: 16, marginBottom: 16 }}>
                    <div className="form-field" style={{ margin: 0 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>Company</label>
                        <select name="company" value={filters.company} onChange={handleFilterChange} style={{ height: 38, fontWeight: 600 }}>
                            <option value="">All Companies</option>
                            <option value="All">All</option>
                            {companies.map((c, i) => <option key={i} value={c}>{c}</option>)}
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
                    <div style={{ marginBottom: 8, fontSize: 13, fontWeight: 700, color: '#334155' }}>
                        Total Amount: <span style={{ color: '#16a34a' }}>₹{totalAmount.toFixed(2)}</span>
                    </div>
                )}

                <ReportToolbar
                    searchTerm={searchTerm} onSearch={setSearchTerm}
                    searchPlaceholder="Search guest, trip ID or vehicle..."
                    page={page} totalPages={totalPages} totalRows={baseData.length}
                    pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                    onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                />

                <div className="table-wrap">
                    <table style={{ margin: 0, fontSize: 12, borderBottom: 'none' }}>
                        <thead style={{ background: '#f8fafc' }}>
                            <tr>
                                <th style={{ width: 40, textAlign: 'center' }}>#</th>
                                <Th label="Trip ID"      col="trip_id"    sortConfig={sortConfig} onSort={handleSort} />
                                <Th label="Guest Name"   col="guest_name" sortConfig={sortConfig} onSort={handleSort} />
                                <Th label="Date"         col="date"       sortConfig={sortConfig} onSort={handleSort} />
                                <Th label="Pickup City"  col="pickup_city"  sortConfig={sortConfig} onSort={handleSort} />
                                <Th label="Drop City"    col="drop_city"    sortConfig={sortConfig} onSort={handleSort} />
                                <Th label="V-Type"       col="v_type"     sortConfig={sortConfig} onSort={handleSort} />
                                <Th label="Vehicle No"   col="vechile_no" sortConfig={sortConfig} onSort={handleSort} />
                                <Th label="Total KMs"    col="total_km"   sortConfig={sortConfig} onSort={handleSort} style={{ textAlign: 'right' }} />
                                <Th label="Amount"       col="total_amt"  sortConfig={sortConfig} onSort={handleSort} style={{ textAlign: 'right' }} />
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr><td colSpan="10" style={{ textAlign: 'center', padding: 40 }}>
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8, color: '#64748b' }}>
                                        <div style={{ width: 28, height: 28, border: '3px solid #e2e8f0', borderTopColor: '#0ea5e9', borderRadius: '50%', animation: 'spin 0.7s linear infinite' }} />
                                        Loading records...
                                    </div>
                                </td></tr>
                            ) : !searched ? (
                                <tr><td colSpan="10" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>Select a date range and click Search.</td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="10" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>No company records found for this period.</td></tr>
                            ) : (
                                paginatedData.map((record, i) => (
                                    <tr key={i}>
                                        <td style={{ textAlign: 'center', color: '#64748b', fontWeight: 600 }}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={{ fontWeight: 800, color: '#023149' }}>{record.trip_id}</td>
                                        <td style={{ fontWeight: 600 }}>{record.guest_name}</td>
                                        <td style={{ whiteSpace: 'nowrap' }}>{fmtDate(record.date)}</td>
                                        <td>{record.pickup_city || '—'}</td>
                                        <td>{record.drop_city || '—'}</td>
                                        <td>{record.v_type || '—'}</td>
                                        <td style={{ fontWeight: 700 }}>{record.vechile_no}</td>
                                        <td style={{ textAlign: 'right', fontWeight: 600 }}>{record.total_km}</td>
                                        <td style={{ textAlign: 'right', fontWeight: 700, color: '#16a34a' }}>₹{record.total_amt}</td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                        {searched && baseData.length > 0 && (
                            <tfoot style={{ background: '#f8fafc', fontWeight: 700 }}>
                                <tr>
                                    <td colSpan="9" style={{ textAlign: 'right', color: '#64748b', padding: '10px 8px' }}>Total Amount:</td>
                                    <td style={{ textAlign: 'right', color: '#023149', fontSize: 13, padding: '10px 8px' }}>₹{totalAmount.toFixed(2)}</td>
                                </tr>
                            </tfoot>
                        )}
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

export default CompanyReport;
