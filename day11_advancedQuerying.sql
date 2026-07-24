USE school_db;

-- Create Employee Table
-- Stores employee details for advanced queries

CREATE TABLE employees_adv (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2)
);

-- Insert sample employee records

INSERT INTO employees_adv
VALUES
(101,'Rahul','IT',50000,5000),
(102,'Keshav','HR',42000,NULL),
(103,'Priya','Finance',65000,7000),
(104,'Ankit','IT',52000,NULL),
(105,'Neha','Marketing',47000,4000);

-- View all employee records

SELECT * FROM employees_adv;

-- CASE
-- Used for conditional logic (similar to IF-ELSE)
-- Categorizes employees based on salary

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Level
FROM employees_adv;

-- Create Retired Employees Table
-- Used for UNION examples

CREATE TABLE retired_employees(
    emp_name VARCHAR(100)
);

-- Insert sample retired employees

INSERT INTO retired_employees
VALUES
('Rahul'),
('Amit'),
('Rohan');

-- UNION
-- Combines results from two queries
-- Removes duplicate records automatically

SELECT emp_name
FROM employees_adv

UNION

SELECT emp_name
FROM retired_employees;

-- UNION ALL
-- Combines results from two queries
-- Keeps duplicate records

SELECT emp_name
FROM employees_adv

UNION ALL

SELECT emp_name
FROM retired_employees;

-- Create Departments Table
-- Used for EXISTS and NOT EXISTS

CREATE TABLE departments_adv(
    department VARCHAR(50)
);

-- Insert sample departments

INSERT INTO departments_adv
VALUES
('IT'),
('Finance');

-- EXISTS
-- Returns employees whose department exists

SELECT *
FROM employees_adv e
WHERE EXISTS
(
    SELECT *
    FROM departments_adv d
    WHERE d.department = e.department
);

-- NOT EXISTS
-- Returns employees whose department does not exist

SELECT *
FROM employees_adv e
WHERE NOT EXISTS
(
    SELECT *
    FROM departments_adv d
    WHERE d.department = e.department
);

-- COALESCE()
-- Returns the first non-NULL value

SELECT
    emp_name,
    COALESCE(bonus,0) AS Bonus
FROM employees_adv;

-- COALESCE() checks multiple values from left to right

SELECT
COALESCE(NULL,NULL,'SQL','Python');

-- IFNULL()
-- Replaces NULL with another value

SELECT
    emp_name,
    IFNULL(bonus,0) AS Bonus
FROM employees_adv;

-- IFNULL() -> Two arguments
-- COALESCE() -> Multiple arguments

-- CAST()
-- Converts one data type into another

SELECT
CAST(salary AS SIGNED)
FROM employees_adv;

SELECT
CAST('123' AS UNSIGNED);

-- CONVERT()
-- Another data type conversion function

SELECT
CONVERT(salary,SIGNED)
FROM employees_adv;

-- Common Mistakes

-- UNION requires both queries to return the same number of columns.

-- CASE must always end with END.

-- UNION combines rows.
-- JOIN combines columns.

-- Use IFNULL() for one replacement value.
-- Use COALESCE() when multiple fallback values are needed.