-- Mock data for local testing: ~100 rows per table, generated via generate_series/random().
-- Run schema.sql (create tables) before this file.

INSERT INTO user_info (name, email, date_of_birth, address, ssn_hash, pass_hash)
SELECT
    'User ' || i,
    'user' || i || '@example.com',
    (DATE '1950-01-01' + (random() * 20000)::int),
    (100 + i) || ' Test St, Springfield',
    '$2b$12$fakessnhash' || i,
    '$2b$12$fakehash' || i
FROM generate_series(1, 100) AS i;

INSERT INTO accounts (user_id, balance, portfolio_size, trade_type, created_at)
SELECT
    i,
    round((random() * 100000)::numeric, 4),
    (ARRAY['Low', 'Balanced', 'High'])[floor(random() * 3 + 1)],
    (ARRAY['Stocks', 'Bonds', 'ETC'])[floor(random() * 2 + 1)],
    NOW() - (random() * INTERVAL '365 days')
FROM generate_series(1, 100) AS i;

INSERT INTO instruments (asset_type, asset_name, ticker, price, currency)
SELECT
    (ARRAY['STOCK', 'CRYPTO', 'ETF', 'BOND'])[floor(random() * 4 + 1)],
    'SYM' || i,
    'TCK' || i,
    round((random() * 990 + 10)::numeric, 4),
    'USD'
FROM generate_series(1, 100) AS i;

INSERT INTO positions (account_id, quantity, instrument_id, opened_at, closed_at, total_price, average_price)
SELECT
    floor(random() * 100 + 1)::int,
    q,
    floor(random() * 100 + 1)::int,
    opened,
    CASE WHEN random() < 0.3 THEN opened + (random() * INTERVAL '30 days') ELSE NULL END,
    round((q * p)::numeric, 4),
    p
FROM (
    SELECT
        i,
        floor(random() * 50 + 1)::int AS q,
        round((random() * 990 + 10)::numeric, 4) AS p,
        NOW() - (random() * INTERVAL '365 days') AS opened
    FROM generate_series(1, 100) AS i
) sub;

INSERT INTO orders (side, account_id, instrument_id, status, quantity, total_price, created_at, updated_at)
SELECT
    (ARRAY['BUY', 'SELL'])[floor(random() * 2 + 1)],
    floor(random() * 100 + 1)::int,
    floor(random() * 100 + 1)::int,
    (ARRAY['PENDING', 'FILLED', 'DECLINED', 'FAILED', 'CANCELED'])[floor(random() * 5 + 1)],
    q,
    round((q * p)::numeric, 4),
    created,
    created + (random() * INTERVAL '2 days')
FROM (
    SELECT
        i,
        floor(random() * 50 + 1)::int AS q,
        round((random() * 990 + 10)::numeric, 4) AS p,
        NOW() - (random() * INTERVAL '365 days') AS created
    FROM generate_series(1, 100) AS i
) sub;

INSERT INTO transactions (amount, side, account_id, transaction_type, happened_at)
SELECT
    round((random() * 5000 + 10)::numeric, 4),
    (ARRAY['IN', 'OUT'])[floor(random() * 2 + 1)],
    floor(random() * 100 + 1)::int,
    (ARRAY['TRADE', 'WITHDRAWL', 'DEPOSIT'])[floor(random() * 3 + 1)],
    NOW() - (random() * INTERVAL '365 days')
FROM generate_series(1, 100) AS i;

INSERT INTO historical_orders (order_id, account_id, order_information_json, created_at)
SELECT
    order_id,
    account_id,
    to_jsonb(o),
    NOW()
FROM orders o;

INSERT INTO admin (username, pass_hash, created_at) VALUES ('admin', '$2b$12$fakehash', NOW());
