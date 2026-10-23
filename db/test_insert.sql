INSERT INTO source_db.user_info (user_id, name, email, date_of_birth, address, ssn_hash, pass_hash)
VALUES (10, 'Jack Johnson', 'jack.johnson@example.com', '1985-06-15', '123 Main St', 'ssn_hash_10', 'pass_hash_10');


INSERT INTO source_db.accounts (account_id, user_id, balance, portfolio_size, trade_type, created_at, account_active)
VALUES (15, 10, 50000.00, 'BALANCED', 'MARGIN', '2026-10-05', true);


INSERT INTO source_db.positions (position_id, account_id, quantity, instrument_id, opened_at, closed_at, total_price, average_price)
VALUES (1, 15, 10, 1, '2026-10-07 09:00:00', NULL, 2369.55, 236.9550);



INSERT INTO source_db.orders (order_id, side, account_id, instrument_id, status, quantity, total_price, created_at, updated_at)
VALUES (25, 'BUY', 15, 1, 'PENDING', 10, 2369.55, '2026-10-07 10:00:00', '2026-10-07 10:00:00');

-- Update order #25 status to FILLED
UPDATE source_db.orders
SET status = 'FILLED', updated_at = '2026-10-07 10:15:00'
WHERE order_id = 25;