-- =====================================================
-- Test Data for Audit Trail - Jack Johnson (User ID 10)
-- Order #25: PENDING → FILLED
-- =====================================================

-- =====================================================
-- SETUP: Insert base data (user, account, instruments, prices)
-- Run this FIRST
-- =====================================================

-- 1. Insert User: Jack Johnson
INSERT INTO source_db.user_info (user_id, name, email, date_of_birth, address, ssn_hash, pass_hash)
VALUES (10, 'Jack Johnson', 'jack.johnson@example.com', '1985-06-15', '123 Main St', 'ssn_hash_10', 'pass_hash_10');

-- 2. Insert Account for Jack Johnson
INSERT INTO source_db.accounts (account_id, user_id, balance, portfolio_size, trade_type, created_at, account_active)
VALUES (15, 10, 50000.00, 'BALANCED', 'MARGIN', '2026-10-05', true);


-- 5. Insert Position (AAPL holding)
INSERT INTO source_db.positions (position_id, account_id, quantity, instrument_id, opened_at, closed_at, total_price, average_price)
VALUES (1, 15, 10, 1, '2026-10-07 09:00:00', NULL, 2369.55, 236.9550);


-- =====================================================
-- SCENARIO 1: Order #25 PENDING (First Load)
-- Run this SECOND
-- =====================================================

INSERT INTO source_db.orders (order_id, side, account_id, instrument_id, status, quantity, total_price, created_at, updated_at)
VALUES (25, 'BUY', 15, 1, 'PENDING', 10, 2369.55, '2026-10-07 10:00:00', '2026-10-07 10:00:00');

-- After this, run: CALL dw.load_warehouse();
-- Check warehouse: SELECT * FROM dw.ribbit_trade_activity WHERE order_id = 25;
-- Expected: 1 row with status PENDING


-- =====================================================
-- SCENARIO 2: Order #25 FILLED (Second Load)
-- Run this THIRD (a few seconds later)
-- =====================================================

-- Update order #25 status to FILLED
UPDATE source_db.orders
SET status = 'FILLED', updated_at = '2026-10-07 10:15:00'
WHERE order_id = 25;

-- After this, run: CALL dw.load_warehouse();
-- Check warehouse: SELECT * FROM dw.ribbit_trade_activity WHERE order_id = 25 ORDER BY warehouse_loaded_at;
-- Expected: 2 rows - one PENDING, one FILLED with different warehouse_loaded_at times


-- =====================================================
-- VERIFICATION QUERIES
-- =====================================================

-- See all snapshots of order #25
SELECT 
    activity_id,
    order_id,
    name,
    side,
    status,
    quantity,
    total_price,
    order_updated_at,
    warehouse_loaded_at
FROM dw.ribbit_trade_activity
WHERE order_id = 25
ORDER BY warehouse_loaded_at;

-- Count total records for Jack Johnson
SELECT 
    user_id,
    name,
    COUNT(*) as snapshots,
    COUNT(DISTINCT order_id) as distinct_orders
FROM dw.ribbit_trade_activity
WHERE user_id = 10
GROUP BY user_id, name;

-- See the audit trail progression
SELECT 
    order_id,
    status,
    order_created_at,
    order_updated_at,
    warehouse_loaded_at,
    LAG(status) OVER (PARTITION BY order_id ORDER BY warehouse_loaded_at) as previous_status
FROM dw.ribbit_trade_activity
WHERE order_id = 25
ORDER BY warehouse_loaded_at;


-- =====================================================
-- CLEANUP (Optional - if you want to start over)
-- =====================================================

/*
DELETE FROM source_db.orders WHERE order_id = 25;
DELETE FROM source_db.positions WHERE account_id = 15;
DELETE FROM source_db.accounts WHERE account_id = 15;
DELETE FROM source_db.user_info WHERE user_id = 10;
DELETE FROM source_db.current_prices WHERE instrument_id = 1;
DELETE FROM source_db.instruments WHERE instrument_id = 1;

DELETE FROM dw.ribbit_trade_activity WHERE order_id = 25;
*/
