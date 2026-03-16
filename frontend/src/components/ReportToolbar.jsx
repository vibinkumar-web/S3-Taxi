/**
 * Shared toolbar for all report pages.
 * Provides: rows-per-page selector, search box, PDF export, Excel export,
 * record count summary, and pagination controls.
 */
const ReportToolbar = ({
    // search
    searchTerm = '',
    onSearch,
    showSearch = true,
    searchPlaceholder = 'Search...',
    // pagination
    page,
    totalPages,
    totalRows,
    pageSize,
    onPageSizeChange,
    onPageChange,
    // export
    onExportPDF,
    onExportExcel,
}) => {
    const btnBase = {
        padding: '5px 14px',
        border: 'none',
        borderRadius: 4,
        fontSize: 12,
        fontWeight: 700,
        cursor: 'pointer',
    };

    return (
        <div>
            {/* Top row: rows-per-page | search + export */}
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: 8, marginBottom: 8 }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                    <label style={{ fontSize: 12, color: '#64748b', fontWeight: 600 }}>Rows:</label>
                    <select
                        value={pageSize}
                        onChange={e => onPageSizeChange(Number(e.target.value))}
                        style={{ padding: '4px 8px', border: '1px solid #cbd5e1', borderRadius: 4, fontSize: 13 }}
                    >
                        {[10, 25, 50, 100].map(n => <option key={n} value={n}>{n}</option>)}
                    </select>
                    <span style={{ fontSize: 12, color: '#64748b' }}>
                        {totalRows} record{totalRows !== 1 ? 's' : ''}
                    </span>
                </div>

                <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                    {showSearch && (
                        <input
                            type="text"
                            placeholder={searchPlaceholder}
                            value={searchTerm}
                            onChange={e => onSearch(e.target.value)}
                            style={{ padding: '5px 10px', border: '1px solid #cbd5e1', borderRadius: 4, fontSize: 13, width: 180 }}
                        />
                    )}
                    <button
                        onClick={onExportPDF}
                        style={{ ...btnBase, background: '#dc2626', color: '#fff' }}
                        title="Download PDF"
                    >
                        ⬇ PDF
                    </button>
                    <button
                        onClick={onExportExcel}
                        style={{ ...btnBase, background: '#16a34a', color: '#fff' }}
                        title="Download Excel"
                    >
                        ⬇ Excel
                    </button>
                </div>
            </div>

            {/* Pagination row */}
            {totalPages > 1 && (
                <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', gap: 6, padding: '8px 0', fontSize: 13 }}>
                    <PaginationBtn label="«" onClick={() => onPageChange(1)} disabled={page === 1} />
                    <PaginationBtn label="‹" onClick={() => onPageChange(page - 1)} disabled={page === 1} />
                    <span style={{ color: '#475569', fontWeight: 600, minWidth: 100, textAlign: 'center' }}>
                        Page {page} of {totalPages}
                    </span>
                    <PaginationBtn label="›" onClick={() => onPageChange(page + 1)} disabled={page === totalPages} />
                    <PaginationBtn label="»" onClick={() => onPageChange(totalPages)} disabled={page === totalPages} />
                </div>
            )}
        </div>
    );
};

const PaginationBtn = ({ label, onClick, disabled }) => (
    <button
        onClick={onClick}
        disabled={disabled}
        style={{
            padding: '4px 10px',
            border: '1px solid #cbd5e1',
            borderRadius: 4,
            background: disabled ? '#f1f5f9' : '#fff',
            color: disabled ? '#94a3b8' : '#023149',
            cursor: disabled ? 'default' : 'pointer',
            fontWeight: 700,
            fontSize: 14,
        }}
    >
        {label}
    </button>
);

export default ReportToolbar;
