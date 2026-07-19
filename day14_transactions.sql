-- Topics:
-- 1. START TRANSACTION
-- 2. COMMIT
-- 3. ROLLBACK
-- 4. SAVEPOINT
-- 5. ROLLBACK TO SAVEPOINT

USE school_db;


CREATE TABLE bank_accounts(
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10,2)
);

-- Insert Data

INSERT INTO bank_accounts
VALUES
(101,'Rahul',50000),
(102,'Priya',30000);

SELECT * FROM bank_accounts;

-- Example 1 : COMMIT

START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 10000
WHERE account_id = 101;

UPDATE bank_accounts
SET balance = balance + 10000
WHERE account_id = 102;

COMMIT;

SELECT * FROM bank_accounts;

-- Example 2 : ROLLBACK

START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 5000
WHERE account_id = 101;

UPDATE bank_accounts
SET balance = balance + 5000
WHERE account_id = 102;

ROLLBACK;

SELECT * FROM bank_accounts;

-- Example 3 : SAVEPOINT

START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 2000
WHERE account_id = 101;

SAVEPOINT sp1;

UPDATE bank_accounts
SET balance = balance + 2000
WHERE account_id = 102;

ROLLBACK TO sp1;

COMMIT;

SELECT * FROM bank_accounts;