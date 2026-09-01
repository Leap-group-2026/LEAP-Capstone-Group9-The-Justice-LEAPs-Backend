DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS transactions;
CREATE TABLE user_info(
	user_id 		SERIAL PRIMARY KEY,
	name			TEXT NOT NULL,
	email			TEXT NOT NULL UNIQUE,
	date_of_birth	DATE NOT NULL,
	address			TEXT NOT NULL,
	ssn				TEXT NOT NULL UNIQUE,
	pass_hash		TEXT NOT NULL
);

CREATE TABLE accounts (
	account_id		SERIAL PRIMARY KEY,
	user_id 		INTEGER NOT NULL REFERENCES user_info(user_id),
	balance			NUMERIC(18, 4) NOT NULL DEFAULT 0,
	role 			TEXT NOT NULL CHECK (role IN ('USER', 'ADMIN', 'ANALYTIC')),
	portfolio_size	TEXT NOT NULL CHECK(portfolio_size IN ('Low', 'Balanced', 'High')),
	created_at		TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE instruments (
	instrument_id	SERIAL PRIMARY KEY,
    ticker			TEXT NOT NULL,
	asset_type		TEXT NOT NULL,
	asset_name		TEXT NOT NULL,
	price			NUMERIC(18, 4) NOT NULL DEFAULT 0,
	currency 		TEXT NOT NULL DEFAULT 'USD'
);

CREATE TABLE positions (
	position_id		SERIAL PRIMARY KEY,
	account_id		INTEGER NOT NULL REFERENCES accounts(account_id),
	quantity		INTEGER NOT NULL,
	instrument_id	INTEGER NOT NULL REFERENCES instruments(instrument_id),
	opened_at		TIMESTAMP NOT NULL DEFAULT NOW(),
	closed_at		TIMESTAMP,
	total_price		NUMERIC(18, 4) NOT NULL,
	average_price	NUMERIC(18, 4) NOT NULL
);


CREATE TABLE orders (
	order_id		SERIAL PRIMARY KEY,
	side			TEXT NOT NULL CHECK (side IN ('BUY', 'SELL')),
	account_id		INTEGER NOT NULL REFERENCES accounts(account_id),
	instrument_id	INTEGER NOT NULL REFERENCES instruments(instrument_id),
	status			TEXT NOT NULL DEFAULT 'PENDING' CHECK (status IN('PENDING', 'FILLED', 'DECLINED', 'FAILED', 'CANCELED')),
	quantity		INTEGER NOT NULL CHECK (quantity > 0),
	total_price		NUMERIC(18, 4) NOT NULL,
	created_at		TIMESTAMP NOT NULL DEFAULT now(),	
	updated_at		TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE transactions(
	transaction_id		SERIAL PRIMARY KEY,
	amount				NUMERIC(18, 4) NOT NULL,
	side				TEXT NOT NULL CHECK(side IN('OUT', 'IN')),
	account_id			INTEGER NOT NULL REFERENCES accounts(account_id),
	transaction_type	TEXT NOT NULL CHECK(transaction_type IN('TRADE', 'WITHDRAWL', 'DEPOSIT')),
	happened_at			TIMESTAMP NOT NULL DEFAULT now()
);