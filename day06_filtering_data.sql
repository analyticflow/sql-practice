-- 1. WHERE
-- 2. Comparison Operators
-- 3. AND
-- 4. OR
-- 5. NOT
-- 6. IN
-- 7. BETWEEN
-- 8. LIKE
-- 9. IS NULL
-- 10. LIMIT


USE school_db;

CREATE TABLE employees_filter(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    experience INT
);

INSERT INTO employees_filter
(emp_name, department, salary, city, experience)
VALUES
('Rahul','IT',50000,'Mumbai',3),
('Keshav','HR',42000,'Delhi',2),
('Priya','Finance',65000,'Pune',5),
('Neha','Marketing',47000,'Jaipur',4),
('Rohan','IT',52000,'Mumbai',6),
('Ankit','HR',39000,'Delhi',1),
('Sneha','Finance',72000,'Pune',7),
('Vishal','IT',48000,'Ahmedabad',3);


SELECT * FROM employees_filter;

SELECT * 
FROM employees_filter
WHERE department = 'IT';

SELECT * 
FROM employees_filter
WHERE salary > 50000;

SELECT * 
FROM employees_filter
WHERE salary < 50000;

SELECT * 
FROM employees_filter
WHERE salary <= 50000;

SELECT *
FROM employees_filter
WHERE city = 'Mumbai';

SELECT *
FROM employees_filter
WHERE city != 'Mumbai';

SELECT * 
FROM employees_filter
WHERE department = 'IT' AND city = 'Mumbai';

SELECT *
FROM employees_filter
WHERE city='Mumbai'OR city='Delhi';

SELECT * 
FROM employees_filter
WHERE NOT department = 'IT';

SELECT * 
FROM employees_filter
WHERE city IN('Pune', 'Mumbai');

SELECT * 
FROM employees_filter
WHERE salary BETWEEN 45000 AND 50000;

SELECT *
FROM employees_filter
WHERE experience BETWEEN 2 AND 5;

SELECT * FROM employees_filter WHERE emp_name LIKE 'R%';

SELECT * FROM employees_filter WHERE emp_name LIKE '%a';

SELECT * FROM employees_filter WHERE emp_name LIKE '%ha%';

SELECT * FROM employees_filter WHERE emp_name LIKE '_____';

INSERT INTO employees_filter
(emp_name,department,salary,city,experience)
VALUES
('Amit','IT',45000,NULL,2);

SELECT * FROM employees_filter 
WHERE city IS NULL;

SELECT * FROM employees_filter 
WHERE city IS NOT NULL;

SELECT * FROM employees_filter LIMIT 3;

SELECT * FROM employees_filter LIMIT 5;

