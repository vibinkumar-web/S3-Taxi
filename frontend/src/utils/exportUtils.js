import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import * as XLSX from 'xlsx';

/**
 * Export table data as a PDF file.
 * @param {Array<{header: string, key: string}>} columns
 * @param {Array<object>} rows
 * @param {string} title  - Report title shown at top of PDF
 * @param {string} filename - Output filename (without extension)
 */
export const exportToPDF = (columns, rows, title, filename = 'report') => {
    const doc = new jsPDF({ orientation: 'landscape', unit: 'mm', format: 'a4' });

    // Header
    doc.setFontSize(16);
    doc.setTextColor(2, 49, 73);
    doc.text('TaxiPro — ' + title, 14, 16);

    doc.setFontSize(9);
    doc.setTextColor(100, 116, 139);
    doc.text('Generated: ' + new Date().toLocaleString(), 14, 23);
    doc.text('Total records: ' + rows.length, 14, 29);

    autoTable(doc, {
        head: [columns.map(c => c.header)],
        body: rows.map(row =>
            columns.map(c => {
                const val = row[c.key];
                return val !== null && val !== undefined ? String(val) : '';
            })
        ),
        startY: 34,
        styles: { fontSize: 8, cellPadding: 2 },
        headStyles: { fillColor: [2, 49, 73], textColor: 255, fontStyle: 'bold' },
        alternateRowStyles: { fillColor: [248, 250, 252] },
        margin: { left: 10, right: 10 },
    });

    doc.save(filename + '.pdf');
};

/**
 * Export table data as an Excel (.xlsx) file.
 * @param {Array<{header: string, key: string}>} columns
 * @param {Array<object>} rows
 * @param {string} filename - Output filename (without extension)
 */
export const exportToExcel = (columns, rows, filename = 'report') => {
    const wsData = [
        columns.map(c => c.header),
        ...rows.map(row =>
            columns.map(c => {
                const val = row[c.key];
                return val !== null && val !== undefined ? val : '';
            })
        ),
    ];

    const ws = XLSX.utils.aoa_to_sheet(wsData);

    // Auto column widths based on header length
    ws['!cols'] = columns.map(c => ({ wch: Math.max(c.header.length + 2, 12) }));

    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Report');
    XLSX.writeFile(wb, filename + '.xlsx');
};
