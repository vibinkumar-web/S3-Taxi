import { useState, useEffect, useContext } from 'react';
import AuthContext from '../context/AuthContext';
import { fmtDateTime } from '../utils/dateFormat';
import { useReportTable } from '../hooks/useReportTable';
import ReportToolbar from '../components/ReportToolbar';
import { exportToPDF, exportToExcel } from '../utils/exportUtils';

const COLUMNS = [
    { header: 'Staff ID',    key: 'id_emp' },
    { header: 'Name',        key: 'staff_name' },
    { header: 'Mobile',      key: 'staff_mobile' },
    { header: 'Email',       key: 'staff_email' },
    { header: 'Department',  key: 'staff_department' },
    { header: 'Login Time',  key: 'login_time' },
    { header: 'Logout Time', key: 'logout' },
    { header: 'Working Hrs', key: 'working_hrs' },
];

const calcWorkingHrs = (login, logout) => {
    if (!logout || logout === '0000-00-00 00:00:00') return 'Active';
    const diffMs = new Date(logout) - new Date(login);
    if (diffMs < 0) return '—';
    const hrs = Math.floor(diffMs / 3600000);
    const mins = String(Math.floor((diffMs % 3600000) / 60000)).padStart(2, '0');
    return `${hrs}h ${mins}m`;
};

const StaffAttendanceReport = () => {
    const { api } = useContext(AuthContext);
    const [staffIds, setStaffIds] = useState([]);
    const [reportData, setReportData] = useState([]);
    const [empId, setEmpId] = useState('');
    const [dateRange, setDateRange] = useState({ from_date: '', to_date: '' });
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        api.get('/staff_report.php?list=true')
            .then(r => setStaffIds(Array.isArray(r.data) ? r.data : []))
            .catch(() => {});
    }, [api]);

    // Auto-fetch whenever empId changes (or on mount)
    useEffect(() => {
        setLoading(true);
        const url = empId ? `/staff_report.php?emp_id=${empId}` : `/staff_report.php`;
        api.get(url)
            .then(r => setReportData(Array.isArray(r.data) ? r.data : []))
            .catch(() => setReportData([]))
            .finally(() => setLoading(false));
    }, [api, empId]);

    const enriched = reportData.map(rec => ({
        ...rec,
        working_hrs: calcWorkingHrs(rec.login_time, rec.logout),
    })).filter(rec => {
        const dateStr = (rec.login_time || '').split(' ')[0];
        const afterFrom = !dateRange.from_date || dateStr >= dateRange.from_date;
        const beforeTo  = !dateRange.to_date   || dateStr <= dateRange.to_date;
        return afterFrom && beforeTo;
    });

    const totalHoursDecimal = reportData.reduce((s, r) => s + (parseFloat(r.duration_hours) || 0), 0);
    const totalHours = Math.floor(totalHoursDecimal);
    const totalMins = String(Math.round((totalHoursDecimal - totalHours) * 60)).padStart(2, '0');

    const { sortConfig, handleSort, paginatedData, sortedData, page, setPage, pageSize, setPageSize, totalPages } = useReportTable(enriched);

    const handleExportPDF = () => exportToPDF(COLUMNS, sortedData, 'Staff Attendance Report', `staff_report_${empId || 'all'}`);
    const handleExportExcel = () => exportToExcel(COLUMNS, sortedData, `staff_report_${empId || 'all'}`);

    const thStyle = (align = 'left') => ({
        padding: '10px 10px', textAlign: align, fontSize: 11, fontWeight: 700,
        textTransform: 'uppercase', color: '#6b7280', borderBottom: '2px solid #e8d4aa',
        whiteSpace: 'nowrap', cursor: 'pointer', background: '#fdf6e8',
    });

    const tdStyle = (extra = {}) => ({
        padding: '9px 10px', borderBottom: '1px solid #f1f5f9', fontSize: 12, ...extra
    });

    return (
        <div style={{ width: '100%', minHeight: '100vh', background: '#fdf6e8', display: 'flex', flexDirection: 'column' }}>
            <div style={{ background: '#023149', width: '100%', padding: '16px 24px' }}>
                <h1 style={{ margin: 0, fontSize: 20, fontWeight: 800, color: '#fff' }}>Staff Attendance Report</h1>
                <p style={{ margin: '4px 0 0', fontSize: 12, color: 'rgba(255,255,255,0.5)' }}>Full staff details — login/logout times, working hours, name, contact and department</p>
            </div>

            <div style={{ width: '100%', padding: '16px 16px 40px', boxSizing: 'border-box', flex: 1 }}>
                <div style={{ display: 'flex', gap: 12, alignItems: 'flex-end', flexWrap: 'wrap', background: '#e2e8f0', padding: 16, marginBottom: 16, borderRadius: 8 }}>
                    <div className="form-field" style={{ margin: 0, minWidth: 200 }}>
                        <label style={{ fontSize: 13, fontWeight: 700, color: '#475569', marginBottom: 4 }}>Staff ID</label>
                        <select value={empId} onChange={e => setEmpId(e.target.value)} style={{ height: 38, fontWeight: 600 }}>
                            <option value="">All Staff</option>
                            {staffIds.map(id => <option key={id} value={id}>{id}</option>)}
                        </select>
                    </div>
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

                {enriched.length > 0 && (
                    <div style={{ display: 'flex', gap: 24, marginBottom: 8, alignItems: 'center', flexWrap: 'wrap' }}>
                        <div style={{ fontSize: 13, fontWeight: 700, color: '#334155' }}>
                            Total Hours: <span style={{ color: '#0f172a' }}>{totalHours}h {totalMins}m</span>
                        </div>
                        <div style={{ fontSize: 13, fontWeight: 700, color: '#334155' }}>
                            Records: <span style={{ color: '#0f172a' }}>{enriched.length}</span>
                        </div>
                    </div>
                )}

                <ReportToolbar
                    showSearch={false}
                    page={page} totalPages={totalPages} totalRows={enriched.length}
                    pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                    onExportPDF={handleExportPDF} onExportExcel={handleExportExcel}
                />

                <div style={{ width: '100%', background: '#fff', borderRadius: 8, border: '1px solid #e8d4aa', boxShadow: '0 1px 4px rgba(2,49,73,.06)', overflowX: 'auto', marginTop: 8 }}>
                    <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 12, tableLayout: 'auto' }}>
                        <thead style={{ position: 'sticky', top: 0, zIndex: 1 }}>
                            <tr>
                                <th style={thStyle()}>S.No</th>
                                <th onClick={() => handleSort('id_emp')} style={thStyle()}>Staff ID {sortConfig.key === 'id_emp' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('staff_name')} style={thStyle()}>Name {sortConfig.key === 'staff_name' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('staff_mobile')} style={thStyle()}>Mobile {sortConfig.key === 'staff_mobile' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('staff_email')} style={thStyle()}>Email {sortConfig.key === 'staff_email' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('staff_department')} style={thStyle()}>Department {sortConfig.key === 'staff_department' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('login_time')} style={thStyle()}>Login Time {sortConfig.key === 'login_time' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('logout')} style={thStyle()}>Logout Time {sortConfig.key === 'logout' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
                                <th onClick={() => handleSort('duration_hours')} style={thStyle()}>Working Hrs {sortConfig.key === 'duration_hours' ? (sortConfig.direction === 'asc' ? '↑' : '↓') : '↕'}</th>
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
                            ) : enriched.length === 0 ? (
                                <tr><td colSpan="9" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>No attendance records found.</td></tr>
                            ) : paginatedData.length === 0 ? (
                                <tr><td colSpan="9" style={{ textAlign: 'center', padding: 40, color: '#94a3b8' }}>No records for this staff ID.</td></tr>
                            ) : (
                                paginatedData.map((rec, i) => (
                                    <tr key={i} style={{ background: i % 2 === 0 ? '#fff' : '#fafafa' }}>
                                        <td style={tdStyle({ fontWeight: 600, color: '#64748b' })}>{(page - 1) * pageSize + i + 1}</td>
                                        <td style={tdStyle({ fontWeight: 700, color: '#023149' })}>{rec.id_emp}</td>
                                        <td style={tdStyle({ fontWeight: 600 })}>{rec.staff_name || '—'}</td>
                                        <td style={tdStyle({ color: '#475569' })}>{rec.staff_mobile || '—'}</td>
                                        <td style={tdStyle({ color: '#475569' })}>{rec.staff_email || '—'}</td>
                                        <td style={tdStyle()}>
                                            {rec.staff_department ? (
                                                <span style={{ background: '#dbeafe', color: '#1e40af', padding: '2px 8px', borderRadius: 10, fontSize: 11, fontWeight: 700 }}>
                                                    {rec.staff_department}
                                                </span>
                                            ) : '—'}
                                        </td>
                                        <td style={tdStyle({ whiteSpace: 'nowrap' })}>{fmtDateTime(rec.login_time)}</td>
                                        <td style={tdStyle({ whiteSpace: 'nowrap' })}>
                                            {rec.logout && rec.logout !== '0000-00-00 00:00:00' ? fmtDateTime(rec.logout) : '—'}
                                        </td>
                                        <td style={tdStyle({ fontWeight: 700, color: rec.working_hrs === 'Active' ? '#16a34a' : '#334155' })}>
                                            {rec.working_hrs === 'Active' ? (
                                                <span style={{ background: '#dcfce7', color: '#166534', padding: '2px 8px', borderRadius: 10, fontSize: 11, fontWeight: 700 }}>Active</span>
                                            ) : rec.working_hrs}
                                        </td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                    <div style={{ padding: '10px 16px', fontSize: 12, color: '#64748b', background: '#f8fafc', borderTop: '1px solid #e2e8f0' }}>
                        Showing {paginatedData.length} of {enriched.length} entries
                    </div>
                </div>

                {totalPages > 1 && (
                    <ReportToolbar showSearch={false} page={page} totalPages={totalPages} totalRows={enriched.length}
                        pageSize={pageSize} onPageSizeChange={setPageSize} onPageChange={setPage}
                        onExportPDF={handleExportPDF} onExportExcel={handleExportExcel} />
                )}
            </div>
            <style>{`@keyframes spin { to { transform: rotate(360deg); } }`}</style>
        </div>
    );
};

export default StaffAttendanceReport;
