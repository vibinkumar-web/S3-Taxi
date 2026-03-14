import { useState, useEffect, useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import { useToast } from '../context/ToastContext';
import { formatBookingId } from '../constants';





import AuthContext from '../context/AuthContext';
const Assignments = () => {
    const toast = useToast();
    const navigate = useNavigate();
    const { api } = useContext(AuthContext);
    const [pendingBookings, setPendingBookings] = useState([]);
    const [loading, setLoading] = useState(true);
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [selectedBooking, setSelectedBooking] = useState(null);
    const [selectedVehicleId, setSelectedVehicleId] = useState('');
    const [availableVehicles, setAvailableVehicles] = useState([]);
    const [loadingVehicles, setLoadingVehicles] = useState(false);

    useEffect(() => {
        fetchBookings();
    }, []);

    const fetchBookings = async () => {
        setLoading(true);
        try {
            const res = await api.get('/assign.php');
            setPendingBookings(Array.isArray(res.data) ? res.data : []);
        } catch (error) {
            console.error("Error fetching bookings", error);
        } finally {
            setLoading(false);
        }
    };

    const openAssignModal = async (booking) => {
        setSelectedBooking(booking);
        setSelectedVehicleId('');
        setAvailableVehicles([]);
        setIsModalOpen(true);
        setLoadingVehicles(true);
        try {
            const res = await api.get(`/available_vehicles.php?v_cat=${encodeURIComponent(booking.v_type || '')}`);
            setAvailableVehicles(Array.isArray(res.data) ? res.data : []);
        } catch (e) {
            setAvailableVehicles([]);
        } finally {
            setLoadingVehicles(false);
        }
    };

    const closeModal = () => {
        setIsModalOpen(false);
        setSelectedBooking(null);
    };

    const handleAssign = async () => {
        if (!selectedVehicleId) return;

        if (!availableVehicles.some(v => v.v_id === selectedVehicleId)) {
            toast("Please select a valid vehicle from the list.");
            return;
        }

        try {
            await api.post('/assign.php', {
                b_id: selectedBooking.b_id,
                v_id: selectedVehicleId
            });

            // Refresh data
            const bookingsRes = await api.get('/assign.php');
            setPendingBookings(Array.isArray(bookingsRes.data) ? bookingsRes.data : []);
            closeModal();
            toast('Vehicle Dispatched Successfully! Check the Trip Closing page when the trip is finished.');
            navigate('/');
        } catch (error) {
            console.error("Error assigning vehicle", error);
            toast('Failed to assign driver.', 'error');
        }
    };

    if (loading) return (
        <div className="page-wrap">
            <div className="page-body" style={{ padding: 40, textAlign: 'center', color: '#023149', fontWeight: 600 }}>
                Loading dispatch assignments...
            </div>
        </div>
    );

    return (
        <div className="page-wrap">
            <div className="page-header">
                <div>
                    <div>
                        <h1>Dispatch Assignments</h1>
                        <p>Assign specific fleet vehicles and active drivers to confirmed bookings</p>
                    </div>
                </div>
            </div>

            <div className="page-body">
                <div className="table-wrap">
                    <table>
                        <thead>
                            <tr>
                                <th>Booking Ref</th>
                                <th>Status</th>
                                <th>Schedule</th>
                                <th>Client Name</th>
                                <th>Origin</th>
                                <th>Destination</th>
                                <th>Service Class</th>
                                <th style={{ textAlign: 'center' }}>A/C</th>
                                <th>Spec. Req</th>
                                <th style={{ textAlign: 'right' }}>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {pendingBookings.map((booking) => (
                                <tr key={booking.b_id}>
                                    <td style={{ fontWeight: 800, color: '#023149', fontFamily: 'monospace', fontSize: 13 }}>{formatBookingId(booking.b_id)}</td>
                                    <td>
                                        <span className={`badge ${booking.booking_status === '1' ? 'badge-green' : 'badge-amber'}`}>
                                            {booking.booking_status === '1' ? 'Confirmed' : 'Pending'}
                                        </span>
                                    </td>
                                    <td style={{ maxWidth: 150, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', fontWeight: 700, color: '#023149' }} title={booking.pickup}>{booking.pickup}</td>
                                    <td>
                                        <div style={{ fontWeight: 600, color: '#023149', maxWidth: 120, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }} title={booking.b_name || booking.to_whom}>{booking.b_name || booking.to_whom}</div>
                                        <div style={{ fontSize: 12, color: '#6b7280' }}>{booking.m_no}</div>
                                    </td>
                                    <td style={{ maxWidth: 120, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }} title={booking.p_city}>{booking.p_city}</td>
                                    <td style={{ maxWidth: 120, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }} title={booking.d_place}>{booking.d_place}</td>
                                    <td>
                                        <span className="badge badge-blue">{booking.v_type}</span>
                                        <div style={{ fontSize: 11, color: '#6b7280', marginTop: 4 }}>{booking.t_type}</div>
                                    </td>
                                    <td style={{ textAlign: 'center' }}>
                                        {booking.ac_type === '1' ? (
                                            <span className="material-icons" style={{ fontSize: 18, color: '#023149' }} title="AC Required">ac_unit</span>
                                        ) : (
                                            <span className="material-icons" style={{ fontSize: 18, color: '#cbd5e1' }} title="Non-AC">remove_circle_outline</span>
                                        )}
                                    </td>
                                    <td style={{ maxWidth: 150, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', color: '#6b7280', fontStyle: 'italic' }} title={booking.remarks}>{booking.remarks || '-'}</td>
                                    <td style={{ textAlign: 'right' }}>
                                        <button
                                            className="btn-ghost"
                                            onClick={() => openAssignModal(booking)}
                                            style={{ padding: '6px 16px', color: '#c5111a', borderColor: '#fecaca', background: '#fef2f2' }}
                                        >
                                            <span className="material-icons" style={{ fontSize: 16 }}>local_taxi</span>
                                            Dispatch
                                        </button>
                                    </td>
                                </tr>
                            ))}
                            {(!pendingBookings || pendingBookings.length === 0) && (
                                <tr>
                                    <td colSpan="10" style={{ textAlign: 'center', padding: '60px 40px', color: '#6b7280' }}>
                                        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8 }}>
                                            <span className="material-icons" style={{ fontSize: 32, color: '#cbd5e1' }}>done_all</span>
                                            <div>All active bookings have been successfully dispatched.</div>
                                            <div style={{ fontSize: 13, marginTop: 4 }}>No pending assignments found in the queue.</div>
                                        </div>
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            </div>

            {isModalOpen && selectedBooking && (
                <div className="modal-overlay">
                    <div className="modal" style={{ maxWidth: 540 }}>
                        <div className="modal-header">
                            <h2 style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                                <span className="material-icons" style={{ color: '#c5111a' }}>assignment_ind</span>
                                Dispatch Assignment — {formatBookingId(selectedBooking.b_id)}
                            </h2>
                            <button onClick={closeModal}>
                                <span className="material-icons">close</span>
                            </button>
                        </div>

                        <div className="modal-body" style={{ padding: '24px 32px' }}>
                            {/* Booking summary */}
                            <div style={{ background: '#f8fafc', border: '1px solid #e2e8f0', borderRadius: 8, padding: 16, marginBottom: 20, display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12 }}>
                                <div>
                                    <div style={{ fontSize: 11, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', marginBottom: 2 }}>Customer</div>
                                    <div style={{ fontSize: 14, fontWeight: 800, color: '#023149' }}>{selectedBooking.b_name || selectedBooking.to_whom}</div>
                                    <div style={{ fontSize: 12, color: '#6b7280' }}>{selectedBooking.m_no}</div>
                                </div>
                                <div style={{ textAlign: 'right' }}>
                                    <div style={{ fontSize: 11, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', marginBottom: 2 }}>Schedule</div>
                                    <div style={{ fontSize: 13, fontWeight: 700, color: '#023149' }}>{selectedBooking.pickup}</div>
                                </div>
                                <div>
                                    <div style={{ fontSize: 11, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', marginBottom: 2 }}>Route</div>
                                    <div style={{ fontSize: 13, fontWeight: 600, color: '#475569' }}>{selectedBooking.p_city} → {selectedBooking.d_place}</div>
                                </div>
                                <div style={{ textAlign: 'right' }}>
                                    <div style={{ fontSize: 11, fontWeight: 700, color: '#c5111a', textTransform: 'uppercase', marginBottom: 2 }}>Required Class</div>
                                    <div style={{ display: 'inline-flex', alignItems: 'center', gap: 6, flexWrap: 'wrap', justifyContent: 'flex-end' }}>
                                        <span style={{ background: '#023149', color: '#fff', borderRadius: 4, padding: '2px 10px', fontSize: 13, fontWeight: 800 }}>{selectedBooking.v_type}</span>
                                        {selectedBooking.ac_type === '1' && <span style={{ background: '#e0f2fe', color: '#0369a1', borderRadius: 4, padding: '2px 8px', fontSize: 11, fontWeight: 700 }}>A/C</span>}
                                        {!loadingVehicles && (
                                            <span style={{ fontSize: 11, color: availableVehicles.length > 0 ? '#16a34a' : '#c5111a', fontWeight: 700 }}>
                                                {availableVehicles.length} available
                                            </span>
                                        )}
                                        {selectedVehicleId && (() => {
                                            const sv = availableVehicles.find(v => v.v_id === selectedVehicleId);
                                            return sv ? (
                                                <div style={{ width: '100%', marginTop: 6, background: '#ecfdf5', border: '1px solid #6ee7b7', borderRadius: 6, padding: '6px 10px', display: 'flex', alignItems: 'center', gap: 6 }}>
                                                    <span className="material-icons" style={{ fontSize: 14, color: '#059669' }}>check_circle</span>
                                                    <span style={{ fontWeight: 800, fontSize: 12, color: '#065f46', fontFamily: 'monospace' }}>{sv.v_no}</span>
                                                    <span style={{ fontSize: 12, color: '#047857', fontWeight: 600 }}>— {sv.v_brand} {sv.v_model}</span>
                                                    <span style={{ fontSize: 11, color: '#6b7280', marginLeft: 4 }}>{sv.d_name}</span>
                                                </div>
                                            ) : null;
                                        })()}
                                    </div>
                                </div>
                            </div>

                            {/* Vehicle selection */}
                            <div style={{ fontSize: 12, fontWeight: 700, color: '#6b7280', textTransform: 'uppercase', marginBottom: 10, letterSpacing: '.04em' }}>
                                Select Vehicle to Dispatch <span style={{ color: '#c5111a' }}>*</span>
                            </div>
                            <form id="assignForm" onSubmit={e => { e.preventDefault(); handleAssign(); }}>
                                {loadingVehicles ? (
                                    <div style={{ textAlign: 'center', padding: '32px 0', color: '#6b7280', fontSize: 14 }}>
                                        <span className="material-icons" style={{ fontSize: 28, display: 'block', marginBottom: 8, color: '#cbd5e1' }}>hourglass_empty</span>
                                        Loading available {selectedBooking.v_type} vehicles...
                                    </div>
                                ) : availableVehicles.length === 0 ? (
                                    <div style={{ textAlign: 'center', padding: '32px 0', color: '#c5111a', fontSize: 14 }}>
                                        <span className="material-icons" style={{ fontSize: 28, display: 'block', marginBottom: 8 }}>do_not_disturb</span>
                                        No {selectedBooking.v_type} vehicles available right now.
                                    </div>
                                ) : (
                                    <div style={{ display: 'flex', flexDirection: 'column', gap: 8, maxHeight: 280, overflowY: 'auto', paddingRight: 4 }}>
                                        {availableVehicles.map(v => {
                                            const vid = v.v_id;
                                            const isSelected = selectedVehicleId === vid;
                                            return (
                                                <div
                                                    key={vid}
                                                    onClick={() => setSelectedVehicleId(vid)}
                                                    style={{
                                                        display: 'flex', alignItems: 'center', gap: 14,
                                                        border: isSelected ? '2px solid #023149' : '1.5px solid #e2e8f0',
                                                        borderRadius: 8, padding: '12px 16px',
                                                        cursor: 'pointer', background: isSelected ? '#023149' : '#fff',
                                                        transition: 'all .15s',
                                                    }}
                                                >
                                                    <span className="material-icons" style={{ fontSize: 22, color: isSelected ? '#fbbf24' : '#94a3b8' }}>local_taxi</span>
                                                    <div style={{ flex: 1 }}>
                                                        <div style={{ fontWeight: 800, fontSize: 14, color: isSelected ? '#fff' : '#023149', fontFamily: 'monospace' }}>{v.v_no}</div>
                                                        <div style={{ fontSize: 12, color: isSelected ? '#94d3f9' : '#6b7280', marginTop: 1 }}>{v.v_brand} {v.v_model}</div>
                                                    </div>
                                                    <div style={{ textAlign: 'right' }}>
                                                        <div style={{ fontWeight: 700, fontSize: 13, color: isSelected ? '#fff' : '#023149' }}>{v.d_name || 'No Driver'}</div>
                                                        <div style={{ fontSize: 12, color: isSelected ? '#94d3f9' : '#6b7280' }}>{v.d_mobile || ''}</div>
                                                        {v.last_km > 0 && (
                                                            <div style={{ fontSize: 11, fontWeight: 700, color: isSelected ? '#fbbf24' : '#0369a1', marginTop: 2 }}>
                                                                {Number(v.last_km).toLocaleString()} KM
                                                            </div>
                                                        )}
                                                    </div>
                                                    {isSelected && <span className="material-icons" style={{ color: '#4ade80', fontSize: 20 }}>check_circle</span>}
                                                </div>
                                            );
                                        })}
                                    </div>
                                )}
                            </form>
                        </div>

                        <div className="modal-footer" style={{ padding: '16px 32px' }}>
                            <button type="button" className="btn-ghost" onClick={closeModal}>Abort</button>
                            <button
                                type="submit"
                                form="assignForm"
                                className="btn-primary"
                                disabled={!selectedVehicleId}
                                style={{
                                    background: '#c5111a',
                                    height: 42,
                                    padding: '0 32px',
                                    opacity: !selectedVehicleId ? 0.6 : 1,
                                    cursor: !selectedVehicleId ? 'not-allowed' : 'pointer'
                                }}
                                onMouseEnter={e => { if (selectedVehicleId) e.currentTarget.style.background = '#7d0907'; }}
                                onMouseLeave={e => { if (selectedVehicleId) e.currentTarget.style.background = '#c5111a'; }}
                            >
                                <span className="material-icons" style={{ fontSize: 18 }}>gavel</span>
                                Exec Dispatch
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};

export default Assignments;
