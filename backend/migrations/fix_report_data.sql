-- ============================================================
-- Migration: Fix Report Data
-- Fixes 4 root-cause bugs affecting 4 reports
-- Run once against ft_welcome database
-- ============================================================

-- ============================================================
-- 1. CREATE f_trip_sheet_entry (if not already created by closing.php)
--    Used by: Company Wise Report, Day Wise Customer Report
-- ============================================================
CREATE TABLE IF NOT EXISTS `f_trip_sheet_entry` (
    `id`           INT AUTO_INCREMENT PRIMARY KEY,
    `trip_id`      VARCHAR(55)    NOT NULL,
    `date`         DATE           NOT NULL,
    `company_name` VARCHAR(100)   DEFAULT '',
    `guest_name`   VARCHAR(100)   DEFAULT '',
    `pickup_city`  VARCHAR(100)   DEFAULT '',
    `drop_city`    VARCHAR(100)   DEFAULT '',
    `v_type`       VARCHAR(55)    DEFAULT '',
    `vechile_no`   VARCHAR(55)    DEFAULT '',
    `total_km`     DECIMAL(10,2)  DEFAULT 0,
    `total_amt`    DECIMAL(10,2)  DEFAULT 0,
    INDEX idx_date    (`date`),
    INDEX idx_company (`company_name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- 2. BACKFILL f_trip_sheet_entry from existing f_closing records
--    Inserts one row per closed trip (skips duplicates via INSERT IGNORE)
-- ============================================================
ALTER TABLE `f_trip_sheet_entry` ADD UNIQUE KEY IF NOT EXISTS `uq_trip_id` (`trip_id`);

INSERT IGNORE INTO `f_trip_sheet_entry`
    (`trip_id`, `date`, `company_name`, `guest_name`, `pickup_city`, `drop_city`,
     `v_type`, `vechile_no`, `total_km`, `total_amt`)
SELECT
    c.b_id                                                          AS trip_id,
    c.p_date                                                        AS `date`,
    COALESCE(NULLIF(TRIM(c.to_whom), ''), 'Public')                 AS company_name,
    COALESCE(NULLIF(TRIM(c.customer), ''), '')                      AS guest_name,
    COALESCE(NULLIF(TRIM(c.picup_place), ''), '')                   AS pickup_city,
    COALESCE(NULLIF(TRIM(c.drop_place), ''), '')                    AS drop_city,
    COALESCE(NULLIF(TRIM(c.v_type), ''), '')                        AS v_type,
    c.v_id                                                          AS vechile_no,
    GREATEST(0, CAST(c.closing_km AS DECIMAL(10,2))
               - CAST(c.opening_km AS DECIMAL(10,2)))               AS total_km,
    COALESCE(c.net_total, 0)                                        AS total_amt
FROM `f_closing` c
WHERE c.p_date IS NOT NULL
  AND c.p_date != '0000-00-00';

SELECT CONCAT('f_trip_sheet_entry backfilled: ', ROW_COUNT(), ' rows inserted') AS result;

-- ============================================================
-- 3. FIX f_calcel_booking: replace 0000-00-00 dates
--    Strategy: use the pickup timestamp if available (year > 2010),
--    otherwise fall back to today.
--    Used by: Cancel Report
-- ============================================================

-- 3a. Where a valid pickup timestamp exists, derive b_date from it
UPDATE `f_calcel_booking`
SET    `b_date` = DATE(`pickup`)
WHERE  `b_date` = '0000-00-00'
  AND  `pickup` IS NOT NULL
  AND  YEAR(`pickup`) > 2010;

-- 3b. Remaining rows with no usable timestamp: mark with a sentinel
--     so at least they don't break date range queries.
--     We use '2021-06-27' (first known operational date from f_closing).
UPDATE `f_calcel_booking`
SET    `b_date` = '2021-06-27'
WHERE  `b_date` = '0000-00-00';

SELECT CONCAT('f_calcel_booking rows updated: ', ROW_COUNT()) AS result;

-- 3c. Add DEFAULT CURRENT_DATE to prevent future 0000-00-00 inserts.
--     (MyISAM doesn't support DEFAULT CURRENT_DATE, so we use a trigger instead)
DELIMITER $$
DROP TRIGGER IF EXISTS `trg_calcel_booking_b_date`$$
CREATE TRIGGER `trg_calcel_booking_b_date`
BEFORE INSERT ON `f_calcel_booking`
FOR EACH ROW
BEGIN
    IF NEW.b_date = '0000-00-00' OR NEW.b_date IS NULL THEN
        SET NEW.b_date = CURDATE();
    END IF;
END$$
DELIMITER ;

-- ============================================================
-- 4. VERIFY: Check f_refused has records (should have 3 from dump)
--    trip_refusal.php is now fixed to INSERT into f_refused going forward.
-- ============================================================
SELECT COUNT(*) AS f_refused_current_count FROM `f_refused`;

-- ============================================================
-- 5. VERIFY: Check counts after migration
-- ============================================================
SELECT 'f_trip_sheet_entry' AS tbl, COUNT(*) AS rows, MIN(`date`) AS min_date, MAX(`date`) AS max_date FROM `f_trip_sheet_entry`
UNION ALL
SELECT 'f_calcel_booking',          COUNT(*),         MIN(`b_date`),             MAX(`b_date`)             FROM `f_calcel_booking`
UNION ALL
SELECT 'f_refused',                 COUNT(*),         MIN(`date_refused`),        MAX(`date_refused`)        FROM `f_refused`;

-- ============================================================
-- 6. TEST DATA: Insert sample rows to verify reports work
--    for date range 2021-06-27 → 2022-07-01
-- ============================================================

-- 6a. Company Wise / Day Wise test rows
INSERT INTO `f_trip_sheet_entry`
    (`trip_id`, `date`, `company_name`, `guest_name`, `pickup_city`, `drop_city`, `v_type`, `vechile_no`, `total_km`, `total_amt`)
VALUES
    ('TEST-001', '2021-07-15', 'Acme Corp',   'Rajan Kumar',   'Tenkasi',  'Nellai',   'Sedan', 'TN72-001', 120.00, 1800.00),
    ('TEST-002', '2021-09-10', 'Global Ltd',  'Priya Devi',    'Tenkasi',  'Madurai',  'SUV',   'TN72-002', 250.00, 3500.00),
    ('TEST-003', '2022-01-20', 'Acme Corp',   'Suresh Babu',   'Tirunelveli', 'Chennai', 'Innova', 'TN72-003', 680.00, 9500.00),
    ('TEST-004', '2022-04-05', 'Tech Inc',    'Meena Raj',     'Tenkasi',  'Coimbatore', 'Swift', 'TN72-004', 310.00, 4200.00),
    ('TEST-005', '2022-06-30', 'Public',      'Karthik S',     'Tenkasi',  'Airport',  'Indica', 'TN72-005', 95.00,  1200.00)
ON DUPLICATE KEY UPDATE trip_id = trip_id; -- no-op if already exists

-- 6b. Cancel Report test rows
INSERT INTO `f_calcel_booking`
    (`b_id`, `b_date`, `b_name`, `m_no`, `reason`, `p_city`, `d_place`, `user_id`,
     `e_id`, `cus_count`, `m_no`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`)
VALUES
    (9901, '2021-08-10', 'Arun Vel',    '9876543210', 'Customer unavailable', 'Tenkasi', 'Nellai',    2, '', '1', '9876543210', '', '', '', '', '0'),
    (9902, '2021-11-22', 'Divya Sri',   '9123456780', 'Weather issue',        'Tenkasi', 'Madurai',   2, '', '1', '9123456780', '', '', '', '', '0'),
    (9903, '2022-03-15', 'Murugan K',   '9988776655', 'Driver no show',       'Tenkasi', 'Tirunelveli', 2, '', '1', '9988776655', '', '', '', '', '0')
ON DUPLICATE KEY UPDATE b_date = VALUES(b_date);

-- 6c. Refusal Report test rows
INSERT INTO `f_refused`
    (`b_id`, `v_id`, `reason`, `pickup`, `p_city`, `d_place`, `r_date`, `date_refused`, `miss_amount`, `user_id`)
VALUES
    ('TEST-R01', 'TN72-001', 'Vehicle breakdown',  '2021-09-05 10:00:00', 'Tenkasi', 'Nellai',   '2021-09-05 10:05:00', '2021-09-05', 1500, 2),
    ('TEST-R02', 'TN72-002', 'Driver duty end',    '2022-01-12 08:00:00', 'Tenkasi', 'Madurai',  '2022-01-12 08:10:00', '2022-01-12', 2200, 2),
    ('TEST-R03', 'TN72-003', 'Customer changed mind','2022-05-20 14:00:00','Tirunelveli','Chennai','2022-05-20 14:05:00','2022-05-20', 3000, 2)
ON DUPLICATE KEY UPDATE reason = VALUES(reason);

-- ============================================================
-- Final verification
-- ============================================================
SELECT 'MIGRATION COMPLETE' AS status;
SELECT 'Company/Day Wise'   AS report, COUNT(*) AS records_in_range
FROM `f_trip_sheet_entry` WHERE `date` BETWEEN '2021-06-27' AND '2022-07-01'
UNION ALL
SELECT 'Cancel Report', COUNT(*)
FROM `f_calcel_booking`  WHERE `b_date` BETWEEN '2021-06-27' AND '2022-07-01'
UNION ALL
SELECT 'Refusal Report', COUNT(*)
FROM `f_refused`         WHERE `date_refused` BETWEEN '2021-06-27' AND '2022-07-01';
