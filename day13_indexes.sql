-- 1. CREATE INDEX
-- 2. SHOW INDEX
-- 3. DROP INDEX

USE school_db;

-- Step 1 : Create Table

CREATE TABLE employees_index(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Step 2 : Insert Data

INSERT INTO employees_index
VALUES
(101,'Rahul','IT','Mumbai',50000),
(102,'Keshav','HR','Delhi',42000),
(103,'Priya','Finance','Pune',65000),
(104,'Ankit','IT','Ahmedabad',52000),
(105,'Neha','Marketing','Jaipur',47000),
(106,'Rohan','IT','Mumbai',51000),
(107,'Sneha','Finance','Delhi',70000);

-- Display Data

SELECT * FROM employees_index;

-- Search Without Index

SELECT *
FROM employees_index
WHERE emp_name = 'Rahul';

-- Create Index

CREATE INDEX idx_emp_name
ON employees_index(emp_name);

-- Show Indexes

SHOW INDEX
FROM employees_index;

-- Search Again

SELECT *
FROM employees_index
WHERE emp_name = 'Rahul';

-- Create Composite Index

CREATE INDEX idx_department_city
ON employees_index(department, city);

-- Search Using Composite Index

SELECT *
FROM employees_index
WHERE department = 'IT'
AND city = 'Mumbai';

-- Drop Index

DROP INDEX idx_emp_name
ON employees_index;

-- Verify Remaining Indexes

SHOW INDEX
FROM employees_index;