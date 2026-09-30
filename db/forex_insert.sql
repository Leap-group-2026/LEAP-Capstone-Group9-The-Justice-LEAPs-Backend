-- Foreign Exchange Rates Insert
-- Run this into an already initialized database
-- IDs will be auto-assigned by the database sequence

-- Insert Forex Instruments (IDs will auto-increment)
INSERT INTO instruments (ticker, asset_type, asset_name, currency)
VALUES
    ('USD/CAD', 'FOREX', 'USD to CAD', 'USD'),
    ('USD/EUR', 'FOREX', 'USD to EUR', 'USD'),
    ('USD/GBP', 'FOREX', 'USD to GBP', 'USD'),
    ('USD/INR', 'FOREX', 'USD to INR', 'USD'),
    ('USD/JPY', 'FOREX', 'USD to JPY', 'USD');

-- Insert Current Prices for Forex
-- IDs will be auto-assigned (62-66 based on sequence)
INSERT INTO current_prices (instrument_id, price, quote_time, retrieved_at)
SELECT 
    i.instrument_id,
    p.price,
    now() - INTERVAL '1 hour',
    now()
FROM (
    VALUES 
    (1.4166),
    (0.87946),
    (0.75403),
    (95.92),
    (157.33)
) AS p(price)
CROSS JOIN (
    SELECT instrument_id FROM instruments 
    WHERE ticker IN ('USD/CAD', 'USD/EUR', 'USD/GBP', 'USD/INR', 'USD/JPY')
    ORDER BY instrument_id
) AS i;
