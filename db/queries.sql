
SELECT 'user_info' AS table_name, COUNT(*) FROM user_info
UNION ALL
SELECT 'accounts', COUNT(*) FROM accounts
UNION ALL
SELECT 'instruments', COUNT(*) FROM instruments
UNION ALL
SELECT 'positions', COUNT(*) FROM positions
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions
UNION ALL
SELECT 'historical_orders', COUNT(*) FROM historical_orders;

SELECT * FROM user_info LIMIT 5;
SELECT * FROM accounts LIMIT 5;
SELECT * FROM instruments LIMIT 5;
SELECT * FROM positions LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM transactions LIMIT 5;
SELECT * FROM historical_orders LIMIT 5;

SELECT order_id, account_id, order_information_json->>'status' AS status, order_information_json->>'quantity' AS quantity
FROM historical_orders
WHERE account_id = 1;
