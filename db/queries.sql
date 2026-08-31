
SELECT 'user_info' AS table_name, COUNT(*) FROM user_info
UNION ALL
SELECT 'accounts', COUNT(*) FROM accounts
UNION ALL
SELECT 'instruments', COUNT(*) FROM instruments
UNION ALL
SELECT 'positions', COUNT(*) FROM positions
UNION ALL
SELECT 'orders', COUNT(*) FROM orders;

SELECT * FROM user_info LIMIT 5;
SELECT * FROM accounts LIMIT 5;
SELECT * FROM instruments LIMIT 5;
SELECT * FROM positions LIMIT 5;
SELECT * FROM orders LIMIT 5;
