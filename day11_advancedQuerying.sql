CREATE TABLE employees_adv (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2)
);

INSERT INTO employees_adv
VALUES
(101,'Rahul','IT',50000,5000),
(102,'Keshav','HR',42000,NULL),
(103,'Priya','Finance',65000,7000),
(104,'Ankit','IT',52000,NULL),
(105,'Neha','Marketing',47000,4000);

SELECT * FROM employees_adv;

SELECT
emp_name,
salary,
CASE
    WHEN salary >= 60000 THEN 'High'
    WHEN salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS Salary_Level
FROM employees_adv;


CREATE TABLE retired_employees(
    emp_name VARCHAR(100)
);

INSERT INTO retired_employees
VALUES
('Rahul'),
('Amit'),
('Rohan');

SELECT emp_name
FROM employees_adv

UNION

SELECT emp_name
FROM retired_employees;


SELECT emp_name
FROM employees_adv

UNION ALL

SELECT emp_name
FROM retired_employees;


CREATE TABLE departments_adv(
    department VARCHAR(50)
);

INSERT INTO departments_adv
VALUES
('IT'),
('Finance');

SELECT *
FROM employees_adv e
WHERE EXISTS
(
    SELECT *
    FROM departments_adv d
    WHERE d.department = e.department
);

SELECT *
FROM employees_adv e
WHERE NOT EXISTS
(
    SELECT *
    FROM departments_adv d
    WHERE d.department = e.department
);

SELECT
emp_name,
COALESCE(bonus,0) AS Bonus
FROM employees_adv;

SELECT
COALESCE(NULL,NULL,'SQL','Python');

SELECT
emp_name,
IFNULL(bonus,0) AS Bonus
FROM employees_adv;

-- IFNULL() → 2 arguments
-- COALESCE() → Multiple arguments

SELECT
CAST(salary AS SIGNED)
FROM employees_adv;

SELECT
CAST('123' AS UNSIGNED);

SELECT
CONVERT(salary,SIGNED)
FROM employees_adv;