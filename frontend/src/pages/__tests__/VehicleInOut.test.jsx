import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';
import VehicleInOut from '../VehicleInOut';
import AuthContext from '../../context/AuthContext';
import { expect, test, vi } from 'vitest';

const mockActiveVehicles = [
    { v_id: 'V001', d_name: 'Driver One', v_no: 'KA-01-AB-1234', vacant_place: 'City Center', login_time: '2023-11-01 08:00:00' },
    { v_id: 'V002', d_name: 'Driver Two', v_no: 'KA-02-CD-5678', vacant_place: 'Airport', login_time: '2023-11-01 09:30:00' }
];

const renderVehicleInOut = (apiMock) => {
    return render(
        <BrowserRouter>
            <AuthContext.Provider value={{ api: apiMock }}>
                <VehicleInOut />
            </AuthContext.Provider>
        </BrowserRouter>
    );
};

test('renders active vehicles table', async () => {
    const apiMock = {
        get: vi.fn().mockResolvedValue({ data: mockActiveVehicles })
    };

    renderVehicleInOut(apiMock);

    expect(screen.getByText(/loading active vehicles network/i)).toBeInTheDocument();

    await waitFor(() => {
        // Component shows count "2" under label "Active"
        expect(screen.getByText('2')).toBeInTheDocument();
    });

    expect(screen.getByText('V001')).toBeInTheDocument();
    expect(screen.getByText('Driver One')).toBeInTheDocument();
    expect(screen.getByText('KA-01-AB-1234')).toBeInTheDocument();

    expect(screen.getByText('V002')).toBeInTheDocument();
    expect(screen.getByText('Driver Two')).toBeInTheDocument();
});

test('handles single vehicle logout', async () => {
    const apiMock = {
        get: vi.fn().mockResolvedValue({ data: mockActiveVehicles }),
        post: vi.fn().mockResolvedValue({ data: { status: 'success', message: 'Logged out successfully' } })
    };

    renderVehicleInOut(apiMock);

    await waitFor(() => {
        expect(screen.getByText('Driver One')).toBeInTheDocument();
    });

    // Both Login and Logout sections have placeholder="Vehicle ID"
    // The logout input is the second one
    const vidInputs = screen.getAllByPlaceholderText('Vehicle ID');
    const logoutInput = vidInputs[1]; // second is the logout input
    fireEvent.change(logoutInput, { target: { value: 'V001' } });

    // Logout button has icon text ("power_settings_new") + button text ("Logout")
    // Use name ending with "Logout" (not "Logout All") to distinguish
    const logoutBtn = screen.getByRole('button', { name: /Logout$/ });
    fireEvent.click(logoutBtn);

    await waitFor(() => {
        expect(apiMock.post).toHaveBeenCalledWith('/vehicle_in_out.php', {
            action: 'logout_single',
            v_id: 'V001'
        });
    });
});

test('handles all vehicle logout with confirmation', async () => {
    const apiMock = {
        get: vi.fn().mockResolvedValue({ data: mockActiveVehicles }),
        post: vi.fn().mockResolvedValue({ data: { status: 'success', message: 'All logged out' } })
    };

    // Mock window.confirm to return true
    const confirmMock = vi.spyOn(window, 'confirm').mockImplementation(() => true);

    renderVehicleInOut(apiMock);

    await waitFor(() => {
        expect(screen.getByText('Driver One')).toBeInTheDocument();
    });

    // Logout All button: icon text "power_settings_new" + "Logout All"
    const logoutAllBtn = screen.getByRole('button', { name: /Logout All/ });
    fireEvent.click(logoutAllBtn);

    await waitFor(() => {
        expect(confirmMock).toHaveBeenCalled();
        expect(apiMock.post).toHaveBeenCalledWith('/vehicle_in_out.php', { action: 'logout_all' });
    });

    confirmMock.mockRestore();
});
