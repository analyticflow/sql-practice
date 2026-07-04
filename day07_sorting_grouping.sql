-- 1. ORDER BY
-- 2. DISTINCT
-- 3. Aggregate Functions
-- 4. GROUP BY
-- 5. HAVING


USE school_db;


CREATE TABLE employees_analysis(
	emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    experience INT
);

INSERT INTO employees_analysis
(emp_name, department, salary, city, experience)
VALUES
('Rahul','IT',50000,'Mumbai',3),
('Keshav','HR',42000,'Delhi',2),
('Priya','Finance',65000,'Pune',5),
('Neha','Marketing',47000,'Jaipur',4),
('Rohan','IT',52000,'Mumbai',6),
('Ankit','HR',39000,'Delhi',1),
('Sneha','Finance',72000,'Pune',7),
('Vishal','IT',48000,'Ahmedabad',3),
('Amit','Marketing',45000,'Mumbai',2),
('Pooja','Finance',68000,'Delhi',6);

SELECT * FROM employees_analysis;

SELECT * FROM employees_analysis ORDER BY salary; -- def ASC

SELECT * 
FROM employees_analysis
ORDER BY salary DESC;  -- DESCENDING

SELECT * 
FROM employees_analysis
ORDER BY emp_name;

SELECT *
FROM employees_analysis
ORDER BY department ASC, salary DESC;

SELECT department
FROM employees_analysis;

SELECT DISTINCT department 
FROM employees_analysis;

SELECT DISTINCT city
FROM employees_analysis;

SELECT COUNT(*) AS TOTAL_EMPLOYEES
FROM employees_analysis;

SELECT COUNT(*) AS FINANCE_COUNT
FROM employees_analysis
WHERE department = 'Finance';

SELECT SUM(salary) AS Total_salary
FROM employees_analysis;

SELECT AVG(salary) AS Average_salary
FROM employees_analysis;

SELECT MAX(salary) AS Highest_Salary
FROM employees_analysis;

SELECT MIN(salary) AS Lowest_salary
FROM employees_analysis;

-- GROUP BY

SELECT department,
AVG(salary) AS Average_Salary
FROM employees_analysis
GROUP BY department;


SELECT department,
COUNT(*) AS Employees
FROM employees_analysis
GROUP BY department;


SELECT department,
MAX(salary) AS Highest_Salary
FROM employees_analysis
GROUP BY department;


SELECT city,
SUM(salary) AS Total_Salary
FROM employees_analysis
GROUP BY city;

SELECT department,
COUNT(*) AS Total_Employees
FROM employees_analysis
GROUP BY department
HAVING COUNT(*) > 2;

SELECT department,
AVG(salary) AS Average_Salary
FROM employees_analysis
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT *
FROM employees_analysis
WHERE salary > 50000;


SELECT department,
AVG(salary)
FROM employees_analysis
GROUP BY department
HAVING AVG(salary)>50000;


SELECT department,
COUNT(*) AS Total
FROM employees_analysis
WHERE city='Mumbai'
GROUP BY department;





