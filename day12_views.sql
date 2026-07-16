-- Topics:
-- 1. What is a View?
-- 2. CREATE VIEW
-- 3. SELECT from View
-- 4. UPDATE View
-- 5. CREATE OR REPLACE VIEW
-- 6. DROP VIEW

USE school_db;

-- Step 1 : Create Table

CREATE TABLE employees_view(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- Step 2 : Insert Data

INSERT INTO employees_view
VALUES
(101,'Rahul','IT',50000,'Mumbai'),
(102,'Keshav','HR',42000,'Delhi'),
(103,'Priya','Finance',65000,'Pune'),
(104,'Ankit','IT',52000,'Ahmedabad'),
(105,'Neha','Marketing',47000,'Jaipur');

SELECT * FROM employees_view;

-- CREATE VIEW

CREATE VIEW it_employees AS
SELECT emp_id, emp_name, salary
FROM employees_view
WHERE department = 'IT';

SELECT * FROM it_employees;

-- Another View

CREATE VIEW high_salary_employees AS
SELECT emp_name, department, salary
FROM employees_view
WHERE salary > 50000;

SELECT * FROM high_salary_employees;

-- CREATE OR REPLACE VIEW

CREATE OR REPLACE VIEW it_employees AS
SELECT emp_name,
department,
salary,
city
FROM employees_view
WHERE department='IT';

SELECT * FROM it_employees;

-- UPDATE Data Through View

UPDATE it_employees
SET salary = 55000
WHERE emp_name='Rahul';

-- Verify Base Table

SELECT * FROM employees_view;

-- Insert Through View

INSERT INTO it_employees
(emp_name, department, salary, city)
VALUES
('Rohan','IT',48000,'Mumbai');

SELECT * FROM employees_view;

-- SHOW ALL VIEWS

SHOW FULL TABLES
WHERE Table_type='VIEW';

-- DROP VIEW

DROP VIEW high_salary_employees;

-- Verify Remaining Views

SHOW FULL TABLES
WHERE Table_type='VIEW';