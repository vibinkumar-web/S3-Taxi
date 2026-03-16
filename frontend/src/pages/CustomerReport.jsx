import { useState, useEffect, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { fmtDate } from '../utils/dateFormat';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'Date',        key: 'p_date' },
    { header: 'Booking ID',  key: 'bid' },
    { header: 'Customer',    key: 'customer' },
    { header: 'Mobile',      key: 'm_no' },
    { header: 'V.Type',      key: 'v_type' },
    { header: 'Pickup City', key: 'picup_place' },
    { header: 'Drop City',   key: 'drop_place' },
    { header: 'Status',      key: 'assign' },
];

const CustomerReport = () => {
    const { api } = useContext(AuthContext);
    const [reportData, setReportData] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [dateRange, setDateRange] = useState({ from_date: '', to_date: '' });
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        setLoading(true);
        api.get('/customer_report.php')
            .then(r => setReportData(Array.isArray(r.data) ? r.data : []))
            .catch(() => setReportData([]))
            .finally(() => setLoading(false));
    }, [api]);

    const baseData = reportData.filter(rec => {
        const dateStr = (rec.p_date || '').split(' ')[0];
        const afterFrom = !dateRange.from_date || dateStr >= dateRange.from_date;
        const beforeTo  = !dateRange.to_date   || dateStr <= dateRange.to_date;
        const matchSearch = !searchTerm ||
            String(rec.bid || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
            String(rec.customer || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
            String(rec.m_no || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
            String(rec.picup_place || '').toLowerCase().includes(searchTerm.toLowerCase()) ||
            String(rec.drop_place || '').toLowerCase().includes(searchTerm.toLowerCase());
        return afterFrom && beforeTo && matchSearch;
    });

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(baseData);

    const handleExportPDF = () => exportToPDF(COLUMNS, sortedData, 'Customer Report', 'customer_report');
    const handleExportExcel = () => exportToExcel(COLUMNS, sortedData, 'customer_report');

    const getStatusBadge = (assign) => {
        const isAssigned = assign === '1' || assign === 1;
        return (
            <span style={{
                display: 'inline-block', padding: '2px 8px', borderRadius: 10,
                fontSize: 11, fontWeight: 700,
                background: isAssigned ? '#dcfce7' : '#fef9c3',
                color: isAssigned ? '#166534' : '#92400e',
            }}>
                {isAssigned ? 'Assigned' : 'Pending'}
            </span>
        );
    };

    const thStyle = (align = 'left') => ({
        padding: '10px 10px', textAlign: align, fontSize: 11, fontWeight: 700,
        textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa',
        whiteSpace: 'nowrap', cursor: 'pointer', background: '#fdf6e8',
    });

    return (
        <div style={{ width: '100%', minHeight: '100vh', background: '#fdf6e8', display: 'flex', flexDirection: 'column' }}>
            <div style={{ background: '#023149', width: '100%', padding: '16px 24px' }}>
                <h1 style={{ margin: 0, fontSize: 20, fontWeight: 800, color: '#fff' }}>Customer Report</h1>
                <p style={{ margin: '4px 0 0', fontSize: 12, color: 'rgba(255,255,255,0.5)' }}>All booking records — customer, vehicle and trip details</p>
            </div>

            <div style={{ width: '100%', padding: '16px 16px 40px', boxSizing: 'border-box', flex: 1 }}>
                <div style={{ display: 'flex', gap: 12, alignItems: 'flex-end', flexWrap: 'wrap', background: '#e2e8f0', padding: 16, marginBottom: 16, borderRadius: 8 }}>
                    <div className="form-field" style={{ margin: 0, minWidth: 150 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>From Date</label>
                        <input type="date" value={dateRange.from_date} onChange={e => setDateRange(d => ({ ...d, from_date: e.target.value }))} style={{ height: 38, fontWeight: 600 }} />
                    </div>
                    <div className="form-field" style={{ margin: 0, minWidth: 150 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>To Date</label>
                        <input type="date" value={dateRange.to_date} onChange={e => setDateRange(d => ({ ...d, to_date: e.target.value }))} style={{ height: 38, fontWeight: 600 }} />
                    </div>
                    {(dateRange.from_date || dateRange.to_date) && (
                        <button type="button" onClick={() => setDateRange({ from_date: '', to_date: '' })} style={{ height: 38, padding: '0 16px', background: '#f1f5f9', border: '1px solid #cbd5e1', borderRadius: 4, fontSize: 12, fontWeight: 600, color: '#64748b', cursor: 'pointer', alignSelf: 'flex-end' }}>Clear Dates</button>
                    )}
                    {loading && <span style={{ fontSize: 13, color: '#64748b', alignSelf: 'center' }}>Loading...</span>}
                </div>
                <ReportToolbar
                    searchTerm={searchTerm} onSearch={setSearchTerm}
                    searchPlaceholder="Search customer, booking ID, mobile or city..."
                    page={page} totalPages={totalPages} totalRows={baseData.length}
                    pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                    onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                />

                <div style={{ width: '100%', background: '#fff', borderRadius: 8, border: '1px solid #e8d4aa', boxShadow: '0 1px 4px rgba(2,49,73,.06)', overflowX: 'auto', marginTop: 8 }}>
                    <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 12, tableLayout: 'auto' }}>
                        <thead style={{ position: 'sticky', top: 0, zIndex: 1 }}>
                            <tr>
                                <th style={thStyle()}>S.No</th>
                                <th onClick={() => handleSort('p_date')} style={thStyle()}>Date {sortConfig.key === 'p_date' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('bid')} style={thStyle()}>Booking ID {sortConfig.key === 'bid' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('customer')} style={thStyle()}>Customer {sortConfig.key === 'customer' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('m_no')} style={thStyle()}>Mobile {sortConfig.key === 'm_no' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('v_type')} style={thStyle()}>V.Type {sortConfig.key === 'v_type' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('picup_place')} style={thStyle()}>Pickup City {sortConfig.key === 'picup_place' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('drop_place')} style={thStyle()}>Drop City {sortConfig.key === 'drop_place' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th style={thStyle()}>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr><td colSpan="9" style={{ textAlign: 'center', padding: 40 }}>
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8, color: '#64748b' }}>
                                        <div style={{ width: 28, height: 28, border: '3px solid #e2e8f0', borderTopColor: '#0ea5e9', borderRadius: '50%', animation: 'spin 0.7s linear infinite' }} />
                                        Loading records...
                                    </div>
                                </td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="9" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>No booking records found.</td></tr>
                            ) : (
                                paginatedData.map((record, i) => (
                                    <tr key={i} style={{ background: i % 2 === 0 ? '#fff' : '#fafafa' }}>
                                        <td style={{ padding: '9px 10px', fontWeight: 600, color: '#64748b', borderBottom: '1px solid #f1f5f9' }}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={{ padding: '9px 10px', whiteSpace: 'nowrap', borderBottom: '1px solid #f1f5f9' }}>{fmtDate(record.p_date)}</td>
                                        <td style={{ padding: '9px 10px', fontWeight: 800, color: '#023149', borderBottom: '1px solid #f1f5f9' }}>{record.bid}</td>
                                        <td style={{ padding: '9px 10px', fontWeight: 700, borderBottom: '1px solid #f1f5f9' }}>{record.customer}</td>
                                        <td style={{ padding: '9px 10px', color: '#475569', borderBottom: '1px solid #f1f5f9' }}>{record.m_no}</td>
                                        <td style={{ padding: '9px 10px', color: '#475569', borderBottom: '1px solid #f1f5f9' }}>{record.v_type || '—'}</td>
                                        <td style={{ padding: '9px 10px', borderBottom: '1px solid #f1f5f9' }}>{record.picup_place || '—'}</td>
                                        <td style={{ padding: '9px 10px', borderBottom: '1px solid #f1f5f9' }}>{record.drop_place || '—'}</td>
                                        <td style={{ padding: '9px 10px', borderBottom: '1px solid #f1f5f9' }}>{getStatusBadge(record.assign)}</td>
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

export default CustomerReport;
