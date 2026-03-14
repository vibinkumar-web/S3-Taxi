/**
 * Convert MySQL date/datetime string to DD/MM/YYYY
 * Input: "2024-03-15" or "2024-03-15 10:30:00"
 */
export const fmtDate = (str) => {
    if (!str || str.startsWith('0000') || str === '—') return '—';
    const datePart = str.split(' ')[0];
    const parts = datePart.split('-');
    if (parts.length !== 3) return str;
    const [y, m, d] = parts;
    if (!y || !m || !d) return str;
    return `${d}/${m}/${y}`;
};

/**
 * Convert MySQL datetime string to DD/MM/YYYY HH:MM
 * Input: "2024-03-15 10:30:00"
 */
export const fmtDateTime = (str) => {
    if (!str || str.startsWith('0000') || str === '—') return '—';
    const [datePart, timePart] = str.split(' ');
    const parts = datePart.split('-');
    if (parts.length !== 3) return str;
    const [y, m, d] = parts;
    if (!y || !m || !d) return str;
    const time = timePart ? timePart.substring(0, 5) : '';
    return time ? `${d}/${m}/${y} ${time}` : `${d}/${m}/${y}`;
};
