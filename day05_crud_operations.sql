-- 1. INSERT
-- 2. SELECT
-- 3. UPDATE
-- 4. DELETE

USE school_db;

CREATE TABLE employees_crud(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

INSERT INTO employees_crud(emp_name, department, salary, city)
VALUES
('Rahul','IT',45000,'Mumbai'),
('Keshav','HR',38000,'Delhi'),
('Priya','Finance',55000,'Pune'),
('Ankit','IT',42000,'Ahmedabad'),
('Neha','Marketing',47000,'Jaipur');

SELECT * FROM employees_crud;

SELECT emp_name, salary 
FROM employees_crud;

SELECT emp_name AS Employee_name , salary AS Monthly_salary 
FROM employees_crud;

UPDATE employees_crud
SET salary = 50000
WHERE emp_name = 'Rahul';

SELECT * FROM employees_crud;

UPDATE employees_crud
SET
department='Management',
city='Bengaluru'
WHERE emp_name='Neha';

DELETE FROM employees_crud
WHERE emp_name = 'Ankit';

SELECT * FROM employees_crud;

DROP TABLE employees_crud;








