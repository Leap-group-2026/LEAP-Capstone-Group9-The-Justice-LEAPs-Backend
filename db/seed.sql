-- Mock Data Script for Justice LEAPs APIs Database
-- This script populates all tables with realistic test data

-- Insert Users
INSERT INTO user_info (name, email, date_of_birth, address, ssn_hash, pass_hash, code)
VALUES
    ('John Smith', 'john.smith@example.com', '1985-03-15', '123 Main St, New York, NY 10001', 'hash_ssn_001', 'hash_pass_001', '123456'),
    ('Sarah Johnson', 'sarah.johnson@example.com', '1990-07-22', '456 Oak Ave, Los Angeles, CA 90001', 'hash_ssn_002', 'hash_pass_002', NULL),
    ('Michael Chen', 'michael.chen@example.com', '1988-11-10', '789 Pine Rd, Chicago, IL 60601', 'hash_ssn_003', 'hash_pass_003', NULL),
    ('Emma Williams', 'emma.williams@example.com', '1992-05-18', '321 Elm St, Houston, TX 77001', 'hash_ssn_004', 'hash_pass_004', '654321'),
    ('David Brown', 'david.brown@example.com', '1987-09-25', '654 Maple Dr, Phoenix, AZ 85001', 'hash_ssn_005', 'hash_pass_005', NULL);

-- Insert Admin
INSERT INTO admin (email, pass_hash, role, created_at)
VALUES
    ('admin@justiceleaps.com', 'hash_admin_001', 'ADMIN', now()),
    ('superadmin@justiceleaps.com', 'hash_admin_002', 'SUPER ADMIN', now() - INTERVAL '30 days'),
    ('analyst@justiceleaps.com', 'hash_analyst_001', 'ANALYST', now() - INTERVAL '15 days');

-- Insert Accounts
INSERT INTO accounts (user_id, balance, portfolio_size, trade_type, created_at, account_active)
VALUES
    (1, 50000.00, 'BALANCED', 'STOCK', now() - INTERVAL '90 days', TRUE),
    (1, 25000.00, 'HIGH', 'OPTIONS', now() - INTERVAL '60 days', TRUE),
    (2, 100000.00, 'LOW', 'STOCK', now() - INTERVAL '120 days', TRUE),
    (3, 75000.00, 'BALANCED', 'STOCK', now() - INTERVAL '45 days', TRUE),
    (4, 30000.00, 'HIGH', 'STOCK', now() - INTERVAL '15 days', TRUE),
    (5, 50000.00, 'BALANCED', 'STOCK', now() - INTERVAL '30 days', FALSE);

-- Insert Instruments (Top 50 S&P 500 stocks)
INSERT INTO instruments (ticker, asset_type, asset_name, currency)
VALUES
    ('NVDA', 'STOCK', 'NVIDIA Corporation', 'USD'),
    ('MSFT', 'STOCK', 'Microsoft Corporation', 'USD'),
    ('AAPL', 'STOCK', 'Apple Inc.', 'USD'),
    ('GOOGL', 'STOCK', 'Alphabet Inc.', 'USD'),
    ('AMZN', 'STOCK', 'Amazon.com Inc.', 'USD'),
    ('META', 'STOCK', 'Meta Platforms Inc.', 'USD'),
    ('TSLA', 'STOCK', 'Tesla Inc.', 'USD'),
    ('BRK.B', 'STOCK', 'Berkshire Hathaway Inc.', 'USD'),
    ('V', 'STOCK', 'Visa Inc.', 'USD'),
    ('JNJ', 'STOCK', 'Johnson & Johnson', 'USD'),
    ('WMT', 'STOCK', 'Walmart Inc.', 'USD'),
    ('XOM', 'STOCK', 'Exxon Mobil Corporation', 'USD'),
    ('JPM', 'STOCK', 'JPMorgan Chase & Co.', 'USD'),
    ('PG', 'STOCK', 'Procter & Gamble Co.', 'USD'),
    ('MA', 'STOCK', 'Mastercard Incorporated', 'USD'),
    ('HD', 'STOCK', 'The Home Depot Inc.', 'USD'),
    ('NFLX', 'STOCK', 'Netflix Inc.', 'USD'),
    ('KO', 'STOCK', 'The Coca-Cola Company', 'USD'),
    ('BAC', 'STOCK', 'Bank of America Corp.', 'USD'),
    ('PEP', 'STOCK', 'PepsiCo Inc.', 'USD'),
    ('CSCO', 'STOCK', 'Cisco Systems Inc.', 'USD'),
    ('DIS', 'STOCK', 'The Walt Disney Company', 'USD'),
    ('VZ', 'STOCK', 'Verizon Communications Inc.', 'USD'),
    ('MRK', 'STOCK', 'Merck & Co. Inc.', 'USD'),
    ('AXP', 'STOCK', 'American Express Company', 'USD'),
    ('ADBE', 'STOCK', 'Adobe Inc.', 'USD'),
    ('WBA', 'STOCK', 'Walgreens Boots Alliance Inc.', 'USD'),
    ('CRM', 'STOCK', 'Salesforce Inc.', 'USD'),
    ('IBM', 'STOCK', 'International Business Machines Corp.', 'USD'),
    ('INTC', 'STOCK', 'Intel Corporation', 'USD'),
    ('QCOM', 'STOCK', 'QUALCOMM Incorporated', 'USD'),
    ('TXN', 'STOCK', 'Texas Instruments Incorporated', 'USD'),
    ('CMG', 'STOCK', 'Chipotle Mexican Grill Inc.', 'USD'),
    ('COST', 'STOCK', 'Costco Wholesale Corporation', 'USD'),
    ('CVX', 'STOCK', 'Chevron Corporation', 'USD'),
    ('LLY', 'STOCK', 'Eli Lilly and Company', 'USD'),
    ('HON', 'STOCK', 'Honeywell International Inc.', 'USD'),
    ('UNH', 'STOCK', 'UnitedHealth Group Incorporated', 'USD'),
    ('CAT', 'STOCK', 'Caterpillar Inc.', 'USD'),
    ('BA', 'STOCK', 'The Boeing Company', 'USD'),
    ('MMM', 'STOCK', '3M Company', 'USD'),
    ('NOC', 'STOCK', 'Northrop Grumman Corporation', 'USD'),
    ('CCI', 'STOCK', 'Crown Castle International Corp.', 'USD'),
    ('SLB', 'STOCK', 'Schlumberger Limited', 'USD'),
    ('USB', 'STOCK', 'U.S. Bancorp', 'USD'),
    ('WFC', 'STOCK', 'Wells Fargo & Company', 'USD'),
    ('BLK', 'STOCK', 'BlackRock Inc.', 'USD'),
    ('SO', 'STOCK', 'Southern Company', 'USD'),
    ('EOG', 'STOCK', 'EOG Resources Inc.', 'USD'),
    ('PSX', 'STOCK', 'Phillips 66', 'USD'),
    ('OXY', 'STOCK', 'Occidental Petroleum Corporation', 'USD'),
    ('BTC/USD', 'CRYPTO', 'Bitcoin', 'USD'),
    ('ETH/USD', 'CRYPTO', 'Ethereum', 'USD'),
    ('SOL/USD', 'CRYPTO', 'Solana', 'USD'),
    ('XRP/USD', 'CRYPTO', 'Ripple', 'USD'),
    ('BNB/USD', 'CRYPTO', 'Binance Coin', 'USD'),
    ('DOGE/USD', 'CRYPTO', 'Dogecoin', 'USD'),
    ('ADA/USD', 'CRYPTO', 'Cardano', 'USD'),
    ('AVAX/USD', 'CRYPTO', 'Avalanche', 'USD'),
    ('LINK/USD', 'CRYPTO', 'Chainlink', 'USD'),
    ('LTC/USD', 'CRYPTO', 'Litecoin', 'USD'),
    ('USD/AUD', 'FOREX', 'USD to AUD', 'USD'),
    ('USD/CAD', 'FOREX', 'USD to CAD', 'USD'),
    ('USD/EUR', 'FOREX', 'USD to EUR', 'USD'),
    ('USD/GBP', 'FOREX', 'USD to GBP', 'USD'),
    ('USD/INR', 'FOREX', 'USD to INR', 'USD'),
    ('USD/JPY', 'FOREX', 'USD to JPY', 'USD');

-- Insert Current Prices
INSERT INTO current_prices (instrument_id, price, quote_time, retrieved_at)
VALUES
    (1, 875.50, now() - INTERVAL '1 hour', now()),
    (2, 420.75, now() - INTERVAL '1 hour', now()),
    (3, 185.30, now() - INTERVAL '1 hour', now()),
    (4, 155.80, now() - INTERVAL '1 hour', now()),
    (5, 195.25, now() - INTERVAL '1 hour', now()),
    (6, 325.60, now() - INTERVAL '1 hour', now()),
    (7, 245.90, now() - INTERVAL '1 hour', now()),
    (8, 625.15, now() - INTERVAL '1 hour', now()),
    (9, 285.40, now() - INTERVAL '1 hour', now()),
    (10, 160.75, now() - INTERVAL '1 hour', now()),
    (11, 95.50, now() - INTERVAL '1 hour', now()),
    (12, 115.25, now() - INTERVAL '1 hour', now()),
    (13, 205.65, now() - INTERVAL '1 hour', now()),
    (14, 168.90, now() - INTERVAL '1 hour', now()),
    (15, 495.30, now() - INTERVAL '1 hour', now()),
    (16, 420.80, now() - INTERVAL '1 hour', now()),
    (17, 480.25, now() - INTERVAL '1 hour', now()),
    (18, 62.40, now() - INTERVAL '1 hour', now()),
    (19, 38.75, now() - INTERVAL '1 hour', now()),
    (20, 82.90, now() - INTERVAL '1 hour', now()),
    (21, 58.50, now() - INTERVAL '1 hour', now()),
    (22, 92.15, now() - INTERVAL '1 hour', now()),
    (23, 42.60, now() - INTERVAL '1 hour', now()),
    (24, 55.75, now() - INTERVAL '1 hour', now()),
    (25, 198.40, now() - INTERVAL '1 hour', now()),
    (26, 612.90, now() - INTERVAL '1 hour', now()),
    (27, 85.30, now() - INTERVAL '1 hour', now()),
    (28, 275.80, now() - INTERVAL '1 hour', now()),
    (29, 38.50, now() - INTERVAL '1 hour', now()),
    (30, 178.25, now() - INTERVAL '1 hour', now()),
    (31, 195.60, now() - INTERVAL '1 hour', now()),
    (32, 185.40, now() - INTERVAL '1 hour', now()),
    (33, 2850.75, now() - INTERVAL '1 hour', now()),
    (34, 625.50, now() - INTERVAL '1 hour', now()),
    (35, 135.80, now() - INTERVAL '1 hour', now()),
    (36, 950.20, now() - INTERVAL '1 hour', now()),
    (37, 515.90, now() - INTERVAL '1 hour', now()),
    (38, 485.60, now() - INTERVAL '1 hour', now()),
    (39, 195.75, now() - INTERVAL '1 hour', now()),
    (40, 180.30, now() - INTERVAL '1 hour', now()),
    (41, 385.50, now() - INTERVAL '1 hour', now()),
    (42, 525.80, now() - INTERVAL '1 hour', now()),
    (43, 195.40, now() - INTERVAL '1 hour', now()),
    (44, 145.20, now() - INTERVAL '1 hour', now()),
    (45, 205.75, now() - INTERVAL '1 hour', now()),
    (46, 425.30, now() - INTERVAL '1 hour', now()),
    (47, 155.90, now() - INTERVAL '1 hour', now()),
    (48, 95.60, now() - INTERVAL '1 hour', now()),
    (49, 125.40, now() - INTERVAL '1 hour', now()),
    (50, 65.15, now() - INTERVAL '1 hour', now()),
    (51, 67250.50, now() - INTERVAL '1 hour', now()),
    (52, 2691.75, now() - INTERVAL '1 hour', now()),
    (53, 178.45, now() - INTERVAL '1 hour', now()),
    (54, 2.48, now() - INTERVAL '1 hour', now()),
    (55, 618.20, now() - INTERVAL '1 hour', now()),
    (56, 0.32, now() - INTERVAL '1 hour', now()),
    (57, 1.05, now() - INTERVAL '1 hour', now()),
    (58, 35.80, now() - INTERVAL '1 hour', now()),
    (59, 28.50, now() - INTERVAL '1 hour', now()),
    (60, 84.75, now() - INTERVAL '1 hour', now()),
    (61, 1.4265, now() - INTERVAL '1 hour', now()),
    (62, 1.4166, now() - INTERVAL '1 hour', now()),
    (63, 0.87946, now() - INTERVAL '1 hour', now()),
    (64, 0.75403, now() - INTERVAL '1 hour', now()),
    (65, 95.92, now() - INTERVAL '1 hour', now()),
    (66, 157.33, now() - INTERVAL '1 hour', now());

-- Insert Positions
INSERT INTO positions (account_id, quantity, instrument_id, opened_at, closed_at, total_price, average_price)
VALUES
    (1, 10, 1, now() - INTERVAL '30 days', NULL, 8755.00, 875.50),
    (1, 25, 2, now() - INTERVAL '25 days', NULL, 10518.75, 420.75),
    (1, 50, 11, now() - INTERVAL '15 days', NULL, 4775.00, 95.50),
    (2, 100, 3, now() - INTERVAL '20 days', NULL, 18530.00, 185.30),
    (3, 5, 6, now() - INTERVAL '60 days', NULL, 1628.00, 325.60),
    (3, 20, 7, now() - INTERVAL '45 days', NULL, 4918.00, 245.90),
    (3, 15, 13, now() - INTERVAL '30 days', NULL, 3084.75, 205.65),
    (4, 30, 22, now() - INTERVAL '10 days', NULL, 2778.00, 92.60),
    (4, 8, 33, now() - INTERVAL '5 days', NULL, 22806.00, 2850.75),
    (5, 40, 20, now() - INTERVAL '10 days', NULL, 3316.00, 82.90);

-- Insert Orders
INSERT INTO orders (side, account_id, instrument_id, status, quantity, total_price, created_at, updated_at)
VALUES
    ('BUY', 1, 1, 'FILLED', 10, 8755.00, now() - INTERVAL '30 days', now() - INTERVAL '30 days'),
    ('BUY', 1, 2, 'FILLED', 25, 10518.75, now() - INTERVAL '25 days', now() - INTERVAL '25 days'),
    ('SELL', 2, 3, 'FILLED', 5, 926.50, now() - INTERVAL '20 days', now() - INTERVAL '20 days'),
    ('BUY', 3, 6, 'FILLED', 5, 1628.00, now() - INTERVAL '60 days', now() - INTERVAL '60 days'),
    ('BUY', 3, 7, 'FILLED', 20, 4918.00, now() - INTERVAL '45 days', now() - INTERVAL '45 days'),
    ('BUY', 4, 22, 'PENDING', 15, 1389.00, now() - INTERVAL '2 days', now() - INTERVAL '2 days'),
    ('BUY', 5, 20, 'FILLED', 40, 3316.00, now() - INTERVAL '10 days', now() - INTERVAL '10 days'),
    ('SELL', 1, 11, 'PENDING', 25, 2387.50, now() - INTERVAL '3 days', now() - INTERVAL '3 days'),
    ('BUY', 2, 13, 'DECLINED', 50, 10282.50, now() - INTERVAL '5 days', now() - INTERVAL '5 days'),
    ('BUY', 4, 33, 'FILLED', 8, 22806.00, now() - INTERVAL '5 days', now() - INTERVAL '5 days'),
    ('SELL', 3, 6, 'FAILED', 2, 651.20, now() - INTERVAL '8 days', now() - INTERVAL '8 days'),
    ('BUY', 1, 5, 'CANCELED', 20, 3905.00, now() - INTERVAL '12 days', now() - INTERVAL '12 days');

-- Insert Transactions
INSERT INTO transactions (amount, side, account_id, transaction_type, happened_at)
VALUES
    (50000.00, 'IN', 1, 'DEPOSIT', now() - INTERVAL '90 days'),
    (8755.00, 'OUT', 1, 'TRADE', now() - INTERVAL '30 days'),
    (10518.75, 'OUT', 1, 'TRADE', now() - INTERVAL '25 days'),
    (100000.00, 'IN', 2, 'DEPOSIT', now() - INTERVAL '120 days'),
    (926.50, 'IN', 2, 'TRADE', now() - INTERVAL '20 days'),
    (75000.00, 'IN', 3, 'DEPOSIT', now() - INTERVAL '45 days'),
    (1628.00, 'OUT', 3, 'TRADE', now() - INTERVAL '60 days'),
    (4918.00, 'OUT', 3, 'TRADE', now() - INTERVAL '45 days'),
    (30000.00, 'IN', 4, 'DEPOSIT', now() - INTERVAL '15 days'),
    (22806.00, 'OUT', 4, 'TRADE', now() - INTERVAL '5 days'),
    (50000.00, 'IN', 5, 'DEPOSIT', now() - INTERVAL '30 days'),
    (3316.00, 'OUT', 5, 'TRADE', now() - INTERVAL '10 days'),
    (5000.00, 'OUT', 1, 'WITHDRAWAL', now() - INTERVAL '20 days'),
    (2000.00, 'OUT', 3, 'WITHDRAWAL', now() - INTERVAL '35 days');

-- Insert Historical Orders
INSERT INTO historical_orders (order_id, account_id, order_information_json, created_at)
VALUES
    (1, 1, '{"symbol": "NVDA", "quantity": 10, "price": 875.50, "side": "BUY", "status": "FILLED", "notes": "Initial position"}', now() - INTERVAL '30 days'),
    (2, 1, '{"symbol": "MSFT", "quantity": 25, "price": 420.75, "side": "BUY", "status": "FILLED", "notes": "Tech diversification"}', now() - INTERVAL '25 days'),
    (3, 2, '{"symbol": "AAPL", "quantity": 5, "price": 185.30, "side": "SELL", "status": "FILLED", "notes": "Profit taking"}', now() - INTERVAL '20 days'),
    (4, 3, '{"symbol": "META", "quantity": 5, "price": 325.60, "side": "BUY", "status": "FILLED", "notes": "New position"}', now() - INTERVAL '60 days'),
    (5, 3, '{"symbol": "TSLA", "quantity": 20, "price": 245.90, "side": "BUY", "status": "FILLED", "notes": "EV sector play"}', now() - INTERVAL '45 days'),
    (7, 5, '{"symbol": "PEP", "quantity": 40, "price": 82.90, "side": "BUY", "status": "FILLED", "notes": "Dividend play"}', now() - INTERVAL '10 days'),
    (10, 4, '{"symbol": "CMG", "quantity": 8, "price": 2850.75, "side": "BUY", "status": "FILLED", "notes": "Restaurant sector"}', now() - INTERVAL '5 days');
