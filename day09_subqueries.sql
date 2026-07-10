-- 1. What is a Subquery?
-- 2. Single Row Subquery
-- 3. Multiple Row Subquery
-- 4. IN
-- 5. ANY
-- 6. ALL
-- 7. Correlated Subquery
-- 8. Subquery in SELECT
-- 9. Subquery in FROM

CREATE TABLE employees_subquery(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);


INSERT INTO employees_subquery
VALUES
(101,'Rahul','IT',50000),
(102,'Keshav','HR',42000),
(103,'Priya','Finance',65000),
(104,'Ankit','IT',52000),
(105,'Neha','Marketing',47000),
(106,'Sneha','Finance',72000),
(107,'Rohan','IT',48000);


SELECT *
FROM employees_subquery
WHERE salary >
(
SELECT AVG(salary)
FROM employees_subquery
);


SELECT *
FROM employees_subquery
WHERE salary =
(
SELECT MAX(salary)
FROM employees_subquery
);


SELECT *
FROM employees_subquery
WHERE salary =
(
SELECT MIN(salary)
FROM employees_subquery
);


CREATE TABLE departments_subquery(
    department VARCHAR(50)
);


INSERT INTO departments_subquery
VALUES
('IT'),
('Finance');


SELECT *
FROM employees_subquery
WHERE department IN
(
SELECT department
FROM departments_subquery
);


SELECT *
FROM employees_subquery
WHERE salary > ANY
(
SELECT salary
FROM employees_subquery
WHERE department='Finance'
);


SELECT *
FROM employees_subquery
WHERE salary > ALL
(
SELECT salary
FROM employees_subquery
WHERE department='IT'
);


SELECT *
FROM employees_subquery e
WHERE salary >
(
SELECT AVG(salary)
FROM employees_subquery
WHERE department=e.department
);


SELECT
emp_name,
salary,
(
SELECT AVG(salary)
FROM employees_subquery
) AS Average_Salary
FROM employees_subquery;


SELECT *
FROM
(
SELECT emp_name,salary
FROM employees_subquery
WHERE salary>50000
) AS HighSalaryEmployees;
