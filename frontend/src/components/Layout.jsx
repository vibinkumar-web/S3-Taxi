import { Outlet } from 'react-router-dom';
import Navbar from './Navbar';

const Layout = () => (
    <div style={{
        width: '100%',
        minHeight: '100vh',
        background: '#fdf6e8',
        display: 'flex',
        flexDirection: 'column',
    }}>
        <Navbar />
        <div style={{ flex: 1, width: '100%' }}>
            <Outlet />
        </div>
    </div>
);

export default Layout;
