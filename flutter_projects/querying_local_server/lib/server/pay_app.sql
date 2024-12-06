-- users table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    user_name TEXT NOT NULL,
    id_number TEXT UNIQUE,
    phone_number TEXT UNIQUE,
    email TEXT UNIQUE
);

-- accounts table
CREATE TABLE accounts (
    account_id INTEGER PRIMARY KEY,
    date_created TEXT,
    date_updated TEXT,
    lender_id INTEGER,
    borrower_id INTEGER,
    total REAL,
    available REAL,
    owed REAL,
    FOREIGN KEY (lender_id) REFERENCES users (user_id),
    FOREIGN KEY (borrower_id) REFERENCES users (user_id)
);

-- transactions table

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    account_id INTEGER,
    transaction_date TEXT,
    transaction_type TEXT,
    amount REAL,
    FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);


-- Correct sample data into users table
INSERT INTO users (user_id, user_name, id_number, phone_number, email) 
VALUES ('101', 'solomon ondula', '33139677', '0792352745', 'solomonondula@gmail.com');

INSERT INTO users (user_id, user_name, id_number, phone_number, email) 
VALUES ('102', 'calvin eaton', '87654321', '0787654321', 'jane@example.com');

-- Correct accounts table with user ids
INSERT INTO accounts (account_id, date_created, date_updated, lender_id, borrower_id, total, available, owed) 
VALUES (77701680, '2023-09-01', '2023-09-01', 101, 102, 1000.00, 500.00, 500.00);

-- Correct transactions table with matching account_id
INSERT INTO transactions (transaction_id, account_id, transaction_date, transaction_type, amount) 
VALUES (1, 77701680, '2023-09-02', 'borrow', 500.00);
