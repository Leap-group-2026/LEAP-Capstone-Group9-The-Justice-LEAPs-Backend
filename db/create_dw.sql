DROP TABLE IF EXISTS dw.ribbit_trade_activity CASCADE;

CREATE TABLE dw.ribbit_trade_activity (
    -- Unique identifier
    activity_id SERIAL PRIMARY KEY,
    
    -- Ids
    user_id INTEGER NOT NULL,
    account_id INTEGER NOT NULL,
    instrument_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL UNIQUE,
    
    -- User dimensions
    name TEXT NOT NULL,
    
    -- Account 
    balance NUMERIC(18, 4) NOT NULL DEFAULT 0,
    trade_type TEXT NOT NULL,
    
    -- Instrument 
    ticker TEXT NOT NULL,
    asset_type TEXT NOT NULL,
    asset_name TEXT NOT NULL,
    currency TEXT DEFAULT 'USD',
    
    -- Price 
    price NUMERIC(18, 4) NOT NULL CHECK (price > 0),
    quote_time TIMESTAMPTZ NOT NULL,
    
    -- Position
    quantity INTEGER NOT NULL,
    opened_at TIMESTAMP NOT NULL,
    closed_at TIMESTAMP,
    total_price NUMERIC(18, 4) NOT NULL,
    average_price NUMERIC(18, 4) NOT NULL,
    
    -- Order facts
    side TEXT NOT NULL CHECK (side IN ('BUY', 'SELL')),
    status TEXT DEFAULT 'PENDING' CHECK (status IN('PENDING', 'FILLED', 'DECLINED', 'FAILED', 'CANCELED')),
    
    -- Timestamps
    order_created_at TIMESTAMP NOT NULL DEFAULT now(),
    order_updated_at TIMESTAMP NOT NULL DEFAULT now(),
    warehouse_loaded_at TIMESTAMP DEFAULT now()
);

-- Indexes
CREATE INDEX idx_user_id ON dw.ribbit_trade_activity(user_id);
CREATE INDEX idx_account_id ON dw.ribbit_trade_activity(account_id);
CREATE INDEX idx_instrument_id ON dw.ribbit_trade_activity(instrument_id);
CREATE INDEX idx_order_created ON dw.ribbit_trade_activity(order_created_at);
CREATE INDEX idx_status ON dw.ribbit_trade_activity(status);
CREATE INDEX idx_side ON dw.ribbit_trade_activity(side);