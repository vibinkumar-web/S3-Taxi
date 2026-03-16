import { useState, useEffect, useContext } from 'react';
import { useToast } from '../context/ToastContext';
import { fmtDateTime } from '../utils/dateFormat';
import AuthContext from '../context/AuthContext';

const StaffAttendance = () => {
    const toast = useToast();
    const { api } = useContext(AuthContext);
    const [attendanceList, setAttendanceList] = useState([]);
    const [formData, setFormData] = useState({
        id_emp: '',
        emp_name: '',
        emp_mobile: ''
    });
    const [loading, setLoading] = useState(false);
    const [staffDetails, setStaffDetails] = useState(null);
    const [salaryData, setSalaryData] = useState(null);

    useEffect(() => { fetchAttendance(); }, []);

    const fetchAttendance = async () => {
        try {
            const response = await api.get('/attendance.php');
            setAttendanceList(Array.isArray(response.data) ? response.data : []);
        } catch (error) { console.error('Error fetching attendance', error); }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
        if (name === 'id_emp') fetchStaffDetails(value);
    };

    const fetchStaffDetails = async (id) => {
        if (!id) { setSalaryData(null); setStaffDetails(null); return; }
        try {
            const [staffRes, salaryRes] = await Promise.all([
                api.get(`/staff.php?emp_id=${id}`),
                api.get(`/staff_report.php?action=salary_summary&emp_id=${id}`)
            ]);
            if (staffRes.data && staffRes.data.emp_id) {
                setStaffDetails(staffRes.data);
                setFormData(prev => ({ ...prev, emp_name: staffRes.data.name, emp_mobile: staffRes.data.mobile }));
            } else {
                setStaffDetails(null);
            }
            if (salaryRes.data && salaryRes.data.total_duration) setSalaryData(salaryRes.data);
            else setSalaryData(null);
        } catch (error) {
            console.error('Error fetching staff details', error);
            setSalaryData(null);
        }
    };

    const handleLogin = async () => {
        if (!formData.id_emp) { toast('Please enter Staff ID', 'warning'); return; }
        setLoading(true);
        try {
            await api.post('/attendance.php', { action: 'login', ...formData });
            toast('Staff Logged In Successfully!');
            fetchAttendance();
            resetForm();
        } catch (error) {
            toast(error.response?.data?.message || 'Login Failed', 'error');
        } finally { setLoading(false); }
    };

    const handleLogout = async () => {
        if (!formData.id_emp) { toast('Please enter Staff ID to logout', 'warning'); return; }
        setLoading(true);
        try {
            const response = await api.post('/attendance.php', { action: 'logout', id_emp: formData.id_emp });
            const msg = response.data.duration_message
                ? `${response.data.message} — ${response.data.duration_message}`
                : response.data.message || 'Staff Logged Out Successfully!';
            toast(msg);
            fetchAttendance();
            fetchStaffDetails(formData.id_emp);
            resetForm();
        } catch (error) {
            toast(error.response?.data?.message || 'Logout Failed', 'error');
        } finally { setLoading(false); }
    };

    const resetForm = () => setFormData(f => ({ ...f, id_emp: '', emp_name: '', emp_mobile: '' }));

    const roleColor = (role) => {
        if (!role) return '#6b7280';
        if (role.toLowerCase().includes('admin')) return '#7c3aed';
        if (role.toLowerCase().includes('manager')) return '#0369a1';
        return '#065f46';
    };

    return (
        <div className="page-wrap">
            {/* ── HEADER ── */}
            <div className="page-header">
                <div>
                    <div>
                        <h1>Staff Attendance</h1>
                        <p>Track employee login and logout times</p>
                    </div>
                </div>
            </div>

            <div className="page-body">
                <div style={{ display: 'flex', flexDirection: 'column', gap: 24 }}>

                    {/* ── TOP SECTION: Mark Attendance ── */}
                    <div style={{ background: '#fff', borderRadius: 12, border: '1px solid #e2e8f0', overflow: 'hidden', boxShadow: '0 2px 8px rgba(2,49,73,.07)' }}>
                        {/* Card Header */}
                        <div style={{ background: 'linear-gradient(135deg,#023149,#0e4d72)', padding: '18px 24px', display: 'flex', alignItems: 'center', gap: 10 }}>
                            <span className="material-icons" style={{ color: '#fbbf24', fontSize: 22 }}>fingerprint</span>
                            <div>
                                <h3 style={{ margin: 0, fontSize: 15, fontWeight: 800, color: '#fff' }}>Mark Attendance</h3>
                                <p style={{ margin: 0, fontSize: 12, color: 'rgba(255,255,255,0.6)' }}>Enter Staff ID to auto-fill details, then clock in or out</p>
                            </div>
                        </div>

                        <div style={{ padding: 24, display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24 }}>

                            {/* LEFT — Input Form */}
                            <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
                                <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
                                    <div className="form-field" style={{ margin: 0 }}>
                                        <label style={{ fontSize: 12, fontWeight: 700, color: '#475569', marginBottom: 4 }}>
                                            Staff ID <span style={{ color: '#c5111a' }}>*</span>
                                        </label>
                                        <input
                                            type="text"
                                            name="id_emp"
                                            value={formData.id_emp}
                                            onChange={handleChange}
                                            placeholder="e.g. 102"
                                            style={{ height: 40 }}
                                        />
                                    </div>
                                    <div style={{ display: 'flex', alignItems: 'center', gap: 6, fontSize: 12, color: '#94a3b8', padding: '4px 2px' }}>
                                        <span className="material-icons" style={{ fontSize: 14 }}>schedule</span>
                                        Time is recorded automatically when you click Clock In / Clock Out
                                    </div>
                                </div>

                                {/* Employee name read-only */}
                                <div className="form-field" style={{ margin: 0 }}>
                                    <label style={{ fontSize: 12, fontWeight: 700, color: '#475569', marginBottom: 4 }}>Employee Name (auto-fill)</label>
                                    <input
                                        type="text"
                                        value={formData.emp_name}
                                        readOnly
                                        placeholder="Will appear after entering Staff ID..."
                                        style={{ height: 40, background: '#f8fafc', color: '#334155', cursor: 'default' }}
                                    />
                                </div>

                                {/* Action Buttons */}
                                <div style={{ display: 'flex', gap: 12, marginTop: 4 }}>
                                    <button
                                        onClick={handleLogin}
                                        disabled={loading}
                                        style={{ flex: 1, height: 44, background: '#15803d', color: '#fff', border: 'none', borderRadius: 8, fontWeight: 800, fontSize: 13, cursor: loading ? 'wait' : 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 6, opacity: loading ? 0.7 : 1, transition: 'background .2s' }}
                                        onMouseEnter={e => e.currentTarget.style.background = '#166534'}
                                        onMouseLeave={e => e.currentTarget.style.background = '#15803d'}
                                    >
                                        <span className="material-icons" style={{ fontSize: 18 }}>login</span>
                                        Clock In
                                    </button>
                                    <button
                                        onClick={handleLogout}
                                        disabled={loading}
                                        style={{ flex: 1, height: 44, background: '#c5111a', color: '#fff', border: 'none', borderRadius: 8, fontWeight: 800, fontSize: 13, cursor: loading ? 'wait' : 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 6, opacity: loading ? 0.7 : 1, transition: 'background .2s' }}
                                        onMouseEnter={e => e.currentTarget.style.background = '#7d0907'}
                                        onMouseLeave={e => e.currentTarget.style.background = '#c5111a'}
                                    >
                                        <span className="material-icons" style={{ fontSize: 18 }}>logout</span>
                                        Clock Out
                                    </button>
                                </div>
                            </div>

                            {/* RIGHT — Employee Details Card */}
                            <div style={{ background: '#f8fafc', borderRadius: 10, border: '1px solid #e2e8f0', padding: 20, display: 'flex', flexDirection: 'column', justifyContent: 'center', minHeight: 160 }}>
                                {staffDetails ? (
                                    <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
                                        <div style={{ display: 'flex', alignItems: 'center', gap: 14 }}>
                                            <div style={{ width: 52, height: 52, borderRadius: '50%', background: 'linear-gradient(135deg,#023149,#0e4d72)', display: 'flex', alignItems: 'center', justifyContent: 'center', color: '#fff', fontSize: 20, fontWeight: 900, flexShrink: 0 }}>
                                                {(staffDetails.name || '?')[0].toUpperCase()}
                                            </div>
                                            <div>
                                                <div style={{ fontSize: 16, fontWeight: 800, color: '#023149' }}>{staffDetails.name}</div>
                                                <div style={{ fontSize: 12, color: '#64748b', marginTop: 2 }}>Staff ID: <span style={{ fontFamily: 'monospace', fontWeight: 700 }}>#{staffDetails.emp_id}</span></div>
                                            </div>
                                            <span style={{ marginLeft: 'auto', background: roleColor(staffDetails.u_type) + '18', color: roleColor(staffDetails.u_type), fontSize: 11, fontWeight: 700, padding: '3px 10px', borderRadius: 20, border: `1px solid ${roleColor(staffDetails.u_type)}40` }}>
                                                {staffDetails.u_type}
                                            </span>
                                        </div>
                                        <hr style={{ border: 'none', borderTop: '1px solid #e2e8f0', margin: 0 }} />
                                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
                                            {[
                                                { icon: 'phone', label: 'Mobile', val: staffDetails.mobile || '—' },
                                                { icon: 'email', label: 'Email', val: staffDetails.email || '—' },
                                                { icon: 'cake', label: 'Date of Birth', val: staffDetails.dob || '—' },
                                                { icon: 'calendar_today', label: 'Joined On', val: staffDetails.j_date || '—' },
                                            ].map(({ icon, label, val }) => (
                                                <div key={label} style={{ display: 'flex', alignItems: 'flex-start', gap: 8 }}>
                                                    <span className="material-icons" style={{ fontSize: 14, color: '#94a3b8', marginTop: 2 }}>{icon}</span>
                                                    <div>
                                                        <div style={{ fontSize: 10, color: '#94a3b8', fontWeight: 700, textTransform: 'uppercase' }}>{label}</div>
                                                        <div style={{ fontSize: 12, color: '#334155', fontWeight: 600 }}>{val}</div>
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                        {salaryData && (
                                            <div style={{ background: '#eff6ff', borderRadius: 8, padding: '10px 14px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', border: '1px solid #bfdbfe' }}>
                                                <div>
                                                    <div style={{ fontSize: 10, fontWeight: 800, color: '#1d4ed8', textTransform: 'uppercase' }}>This Month</div>
                                                    <div style={{ fontSize: 12, color: '#1e40af', fontWeight: 600, marginTop: 2 }}>Total Hours Worked</div>
                                                </div>
                                                <div style={{ fontSize: 26, fontWeight: 900, color: '#1d4ed8' }}>{salaryData.total_duration}</div>
                                            </div>
                                        )}
                                    </div>
                                ) : (
                                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 10, color: '#94a3b8' }}>
                                        <span className="material-icons" style={{ fontSize: 40, color: '#cbd5e1' }}>badge</span>
                                        <div style={{ fontSize: 13, fontWeight: 600 }}>Employee details will appear here</div>
                                        <div style={{ fontSize: 12 }}>Enter a valid Staff ID above</div>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* ── ACTIVE LOGINS ── */}
                    <div style={{ background: '#fff', borderRadius: 12, border: '1px solid #e8d4aa', overflow: 'hidden', boxShadow: '0 2px 8px rgba(2,49,73,.06)' }}>
                        <div style={{ background: '#fdf6e8', padding: '14px 20px', display: 'flex', alignItems: 'center', gap: 8, borderBottom: '2px solid #e8d4aa' }}>
                            <span className="material-icons" style={{ color: '#023149', fontSize: 18 }}>how_to_reg</span>
                            <h2 style={{ margin: 0, fontSize: 13, fontWeight: 800, color: '#023149', textTransform: 'uppercase', letterSpacing: '.05em' }}>Currently Logged In</h2>
                            <span style={{ marginLeft: 'auto', background: attendanceList.length > 0 ? '#15803d' : '#6b7280', color: '#fff', fontSize: 11, fontWeight: 800, padding: '2px 12px', borderRadius: 20 }}>
                                {attendanceList.length} Online
                            </span>
                        </div>
                        <table style={{ width: '100%', borderCollapse: 'collapse', tableLayout: 'fixed' }}>
                            <colgroup>
                                <col style={{ width: '12%' }} />
                                <col style={{ width: '28%' }} />
                                <col style={{ width: '22%' }} />
                                <col style={{ width: '38%' }} />
                            </colgroup>
                            <thead>
                                <tr style={{ background: '#fdf6e8' }}>
                                    {['Staff ID', 'Name', 'Mobile', 'Logged In At'].map(h => (
                                        <th key={h} style={{ padding: '10px 16px', textAlign: 'left', fontSize: 11, fontWeight: 800, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.04em', borderBottom: '1px solid #e8d4aa' }}>{h}</th>
                                    ))}
                                </tr>
                            </thead>
                            <tbody>
                                {attendanceList.length === 0 ? (
                                    <tr><td colSpan="4" style={{ textAlign: 'center', padding: 36, color: '#94a3b8', fontSize: 13 }}>
                                        No staff currently logged in.
                                    </td></tr>
                                ) : attendanceList.map((row, i) => (
                                    <tr key={row.id} style={{ background: i % 2 === 0 ? '#fff' : '#fafafa', borderBottom: '1px solid #f1f5f9' }}>
                                        <td style={{ padding: '10px 16px', fontWeight: 800, color: '#023149', fontFamily: 'monospace', fontSize: 13 }}>{row.id_emp}</td>
                                        <td style={{ padding: '10px 16px', fontWeight: 600, fontSize: 13, color: '#1e293b' }}>{row.emp_name || '—'}</td>
                                        <td style={{ padding: '10px 16px', fontSize: 13, color: '#475569' }}>{row.emp_mobile || '—'}</td>
                                        <td style={{ padding: '10px 16px', fontSize: 13, color: '#475569', display: 'flex', alignItems: 'center', gap: 6 }}>
                                            <span className="material-icons" style={{ fontSize: 14, color: '#15803d' }}>schedule</span>
                                            {fmtDateTime(row.login_time)}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>

                    {/* ── SHIFT HISTORY ── */}
                    {salaryData && (
                        <div style={{ background: '#fff', borderRadius: 12, border: '1px solid #e2e8f0', overflow: 'hidden', boxShadow: '0 2px 8px rgba(0,0,0,.05)' }}>
                            <div style={{ background: '#f8fafc', padding: '14px 20px', display: 'flex', alignItems: 'center', gap: 8, borderBottom: '2px solid #e2e8f0' }}>
                                <span className="material-icons" style={{ color: '#475569', fontSize: 18 }}>history</span>
                                <h2 style={{ margin: 0, fontSize: 13, fontWeight: 800, color: '#475569', textTransform: 'uppercase', letterSpacing: '.05em' }}>
                                    Shift History — {formData.emp_name || formData.id_emp}
                                </h2>
                                <span style={{ marginLeft: 'auto', background: '#eff6ff', color: '#1d4ed8', fontSize: 12, fontWeight: 800, padding: '3px 12px', borderRadius: 20, border: '1px solid #bfdbfe' }}>
                                    Total: {salaryData.total_duration}
                                </span>
                            </div>
                            <table style={{ width: '100%', borderCollapse: 'collapse', tableLayout: 'fixed' }}>
                                <colgroup>
                                    <col style={{ width: '25%' }} />
                                    <col style={{ width: '28%' }} />
                                    <col style={{ width: '28%' }} />
                                    <col style={{ width: '19%' }} />
                                </colgroup>
                                <thead>
                                    <tr style={{ background: '#f8fafc' }}>
                                        {[['Name', 'left'], ['Clock In', 'left'], ['Clock Out', 'left'], ['Duration', 'center']].map(([h, align]) => (
                                            <th key={h} style={{ padding: '10px 16px', textAlign: align, fontSize: 11, fontWeight: 800, color: '#6b7280', textTransform: 'uppercase', letterSpacing: '.04em', borderBottom: '1px solid #e2e8f0' }}>{h}</th>
                                        ))}
                                    </tr>
                                </thead>
                                <tbody>
                                    {salaryData.shifts.length === 0 ? (
                                        <tr><td colSpan="4" style={{ textAlign: 'center', padding: 36, color: '#94a3b8', fontSize: 13 }}>No shifts recorded this month.</td></tr>
                                    ) : salaryData.shifts.map((shift, i) => {
                                        const isActive = !shift.logout || shift.logout === '0000-00-00 00:00:00';
                                        return (
                                            <tr key={i} style={{ background: i % 2 === 0 ? '#fff' : '#fafafa', borderBottom: '1px solid #f1f5f9' }}>
                                                <td style={{ padding: '10px 16px', fontWeight: 700, color: '#023149', fontSize: 13 }}>
                                                    {shift.emp_name || formData.emp_name || '—'}
                                                </td>
                                                <td style={{ padding: '10px 16px', fontSize: 13, color: '#334155' }}>
                                                    <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
                                                        <span className="material-icons" style={{ fontSize: 13, color: '#15803d' }}>login</span>
                                                        {fmtDateTime(shift.login_time)}
                                                    </div>
                                                </td>
                                                <td style={{ padding: '10px 16px', fontSize: 13 }}>
                                                    {isActive
                                                        ? <span style={{ background: '#dcfce7', color: '#166534', padding: '3px 10px', borderRadius: 20, fontSize: 11, fontWeight: 700 }}>Still Active</span>
                                                        : <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
                                                            <span className="material-icons" style={{ fontSize: 13, color: '#c5111a' }}>logout</span>
                                                            <span style={{ color: '#64748b' }}>{fmtDateTime(shift.logout)}</span>
                                                          </div>
                                                    }
                                                </td>
                                                <td style={{ padding: '10px 16px', textAlign: 'center' }}>
                                                    <span style={{ background: isActive ? '#f0fdf4' : '#eff6ff', color: isActive ? '#166534' : '#1d4ed8', padding: '3px 12px', borderRadius: 20, fontWeight: 800, fontSize: 13, border: `1px solid ${isActive ? '#bbf7d0' : '#bfdbfe'}` }}>
                                                        {shift.duration_formatted || '—'}
                                                    </span>
                                                </td>
                                            </tr>
                                        );
                                    })}
                                </tbody>
                            </table>
                        </div>
                    )}

                </div>
            </div>
        </div>
    );
};

export default StaffAttendance;
