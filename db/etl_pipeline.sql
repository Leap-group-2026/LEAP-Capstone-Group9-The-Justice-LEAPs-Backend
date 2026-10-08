-- =====================================================
-- ETL Process: Load OLTP Data to Data Warehouse
-- =====================================================
-- Historical Data Warehouse - Keeps ALL data, old and new
-- Tracks complete audit trail of all trades, account changes, and order updates
-- Source tables: user_info, accounts, instruments, current_prices, positions, orders
-- Target table: dw.ribbit_trade_activity
-- =====================================================
CREATE OR REPLACE PROCEDURE dw.load_warehouse()
LANGUAGE plpgsql
AS $$       
BEGIN
    -- Main ETL Insert/Update - Load all orders and their current state
    INSERT INTO dw.ribbit_trade_activity (
        user_id,
        account_id,
        instrument_id,
        order_id,
        name,
        balance,
        trade_type,
        ticker,
        asset_type,
        asset_name,
        currency,
        price,
        quote_time,
        quantity,
        opened_at,
        closed_at,
        total_price,
        average_price,
        side,
        status,
        order_created_at,
        order_updated_at,
        warehouse_loaded_at
    )
    SELECT DISTINCT ON (o.order_id)
        -- User and Account IDs
        u.user_id as user_id,
        a.account_id as account_id,
        i.instrument_id as instrument_id,
        o.order_id as order_id,
        
        -- User Dimensions
        u.name,
        
        -- Account Dimensions
        a.balance,
        a.trade_type,
        
        -- Instrument Dimensions
        i.ticker,
        i.asset_type,
        i.asset_name,
        i.currency,
        
        -- Current Price Dimensions
        crp.price,
        crp.quote_time,
        
        -- Position Dimensions
        p.quantity,
        p.opened_at,
        p.closed_at,
        p.total_price,
        p.average_price,
        
        -- Order Dimensions
        o.side,
        o.status,
        o.created_at as order_created_at,
        o.updated_at as order_updated_at,
        
        now()::TIMESTAMP as warehouse_loaded_at
        
    FROM source_db.orders o
        INNER JOIN source_db.accounts a ON o.account_id = a.account_id
        INNER JOIN source_db.user_info u ON a.user_id = u.user_id
        INNER JOIN source_db.instruments i ON o.instrument_id = i.instrument_id
        INNER JOIN source_db.current_prices crp ON i.instrument_id = crp.instrument_id
        INNER JOIN source_db.positions p ON o.account_id = p.account_id 
            AND o.instrument_id = p.instrument_id
    WHERE o.created_at > (
        SELECT COALESCE(MAX(order_created_at), '1900-01-01'::TIMESTAMP)
        FROM dw.ribbit_trade_activity
    )
    OR o.updated_at > (
        SELECT COALESCE(MAX(order_updated_at), '1900-01-01'::TIMESTAMP)
        FROM dw.ribbit_trade_activity
    )
    ORDER BY o.order_id, o.updated_at DESC
    ON CONFLICT (order_id) DO UPDATE SET
        status = EXCLUDED.status,
        order_updated_at = EXCLUDED.order_updated_at,
        balance = EXCLUDED.balance,
        price = EXCLUDED.price,
        quote_time = EXCLUDED.quote_time,
        warehouse_loaded_at = EXCLUDED.warehouse_loaded_at;

    RAISE NOTICE 'Warehouse loaded successfully';
END;
$$;