import { useState, useMemo } from 'react';

/**
 * Manages sorting and client-side pagination for a report table.
 *
 * @param {Array<object>} data - The full dataset to sort/paginate
 * @param {number} defaultPageSize - Initial rows per page (default 25)
 * @returns sorting controls, paginated slice, and pagination state
 */
export const useReportTable = (data = [], defaultPageSize = 25) => {
    const [sortConfig, setSortConfig] = useState({ key: null, direction: 'asc' });
    const [page, setPage] = useState(1);
    const [pageSize, setPageSizeRaw] = useState(defaultPageSize);

    const handleSort = (key) => {
        setSortConfig(prev => ({
            key,
            direction: prev.key === key && prev.direction === 'asc' ? 'desc' : 'asc',
        }));
        setPage(1);
    };

    const sortedData = useMemo(() => {
        if (!sortConfig.key) return data;
        return [...data].sort((a, b) => {
            const aVal = a[sortConfig.key] ?? '';
            const bVal = b[sortConfig.key] ?? '';
            const aNum = parseFloat(aVal);
            const bNum = parseFloat(bVal);
            if (!isNaN(aNum) && !isNaN(bNum)) {
                return sortConfig.direction === 'asc' ? aNum - bNum : bNum - aNum;
            }
            return sortConfig.direction === 'asc'
                ? String(aVal).localeCompare(String(bVal))
                : String(bVal).localeCompare(String(aVal));
        });
    }, [data, sortConfig]);

    const totalPages = Math.max(1, Math.ceil(sortedData.length / pageSize));
    const safePage = Math.min(page, totalPages);

    const paginatedData = useMemo(() => {
        const start = (safePage - 1) * pageSize;
        return sortedData.slice(start, start + pageSize);
    }, [sortedData, safePage, pageSize]);

    const setPageSize = (size) => {
        setPageSizeRaw(size);
        setPage(1);
    };

    return {
        sortConfig,
        handleSort,
        paginatedData,
        sortedData,
        page: safePage,
        setPage,
        pageSize,
        setPageSize,
        totalPages,
        totalRows: data.length,
    };
};
