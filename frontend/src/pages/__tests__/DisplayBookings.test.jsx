import { render, screen, waitFor } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';
import DisplayBookings from '../DisplayBookings';
import AuthContext from '../../context/AuthContext';
import { expect, test, vi } from 'vitest';

const mockBookings = [
    { b_id: '501', b_name: 'Alice Green', m_no: '9876543210', pickup: '2024-01-15 10:00:00', p_city: 'City A', d_place: 'Airport', v_type: 'Sedan', booking_status: 'Closed', assign: '1' },
    { b_id: '502', b_name: 'Bob Blue', m_no: '8765432109', pickup: '2024-01-16 14:00:00', p_city: 'Station', d_place: 'Hotel', v_type: 'SUV', booking_status: 'Closed', assign: '0' }
];

// API returns { bookings: [...], total: N, pages: N } — plain array is NOT valid
const mockResponse = { bookings: mockBookings, total: 2, pages: 1 };

const renderDisplayBookings = (apiMock) => {
    return render(
        <BrowserRouter>
            <AuthContext.Provider value={{ api: apiMock }}>
                <DisplayBookings />
            </AuthContext.Provider>
        </BrowserRouter>
    );
};

test('shows loading state initially', () => {
    const apiMock = { get: vi.fn().mockReturnValue(new Promise(() => {})) };
    renderDisplayBookings(apiMock);

    // Component renders "Loading..." in the table body when loading and no data yet
    expect(screen.getByText(/Loading\.\.\./i)).toBeInTheDocument();
});

test('renders All Bookings page with data from API', async () => {
    const apiMock = { get: vi.fn().mockResolvedValue({ data: mockResponse }) };
    renderDisplayBookings(apiMock);

    await waitFor(() => {
        expect(screen.getByText('All Bookings')).toBeInTheDocument();
    });

    expect(screen.getByText('Alice Green')).toBeInTheDocument();
    expect(screen.getByText('Bob Blue')).toBeInTheDocument();
    // Booking IDs are formatted via formatBookingId()
    expect(screen.getByText('BK-0501')).toBeInTheDocument();
    expect(screen.getByText('BK-0502')).toBeInTheDocument();
    // API is called with bookings endpoint (full URL includes page and limit params)
    expect(apiMock.get).toHaveBeenCalledWith(expect.stringContaining('/bookings.php'));
});

test('shows booking count in header after loading', async () => {
    const apiMock = { get: vi.fn().mockResolvedValue({ data: mockResponse }) };
    renderDisplayBookings(apiMock);

    await waitFor(() => {
        // After load: bookings.length = 2, total = 2
        // Component renders them as separate text nodes in the header count area
        expect(screen.getByText('Alice Green')).toBeInTheDocument();
    });
    // Count display shows "2" (bookings shown) and "/ 2" (total)
    expect(screen.getByText('2')).toBeInTheDocument();
});

test('handles empty bookings list', async () => {
    const apiMock = { get: vi.fn().mockResolvedValue({ data: { bookings: [], total: 0, pages: 1 } }) };
    renderDisplayBookings(apiMock);

    await waitFor(() => {
        expect(screen.getByText('All Bookings')).toBeInTheDocument();
    });

    expect(screen.getByText(/No bookings match your filters/i)).toBeInTheDocument();
});