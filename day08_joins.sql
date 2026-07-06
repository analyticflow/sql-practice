-- 1. INNER JOIN
-- 2. LEFT JOIN
-- 3. RIGHT JOIN
-- 4. FULL OUTER JOIN (Concept)
-- 5. CROSS JOIN
-- 6. SELF JOIN

USE school_db;

CREATE TABLE department(
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) 
    );
    
INSERT INTO department
VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing');
    
    
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT
);

INSERT INTO employee
VALUES
(101,'Rahul',1),
(102,'Priya',2),
(103,'Keshav',1),
(104,'Ankit',3),
(105,'Neha',NULL);

SELECT * FROM employee;

-- INNER JOIN
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employee e
INNER JOIN department d ON e.dept_id = d.dept_id;

-- LEFT JOIN
SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d ON e.dept_id = d.dept_id;

-- RIGHT JOIN
SELECT
e.emp_name,
d.dept_name
FROM employee e
RIGHT JOIN department d
ON e.dept_id=d.dept_id;

-- FULL OUTER JOIN
SELECT
e.emp_name,
d.dept_name
FROM employee e
LEFT JOIN department d
ON e.dept_id=d.dept_id
UNION
SELECT
e.emp_name,
d.dept_name
FROM employee e
RIGHT JOIN department d
ON e.dept_id=d.dept_id;

-- CROSS JOIN
SELECT e.emp_name, d.dept_name
FROM employee e
CROSS JOIN department d;

-- SELF JOIN
CREATE TABLE managers(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    manager_id INT
);

INSERT INTO managers
VALUES
(1,'Rahul',NULL),
(2,'Priya',1),
(3,'Keshav',1),
(4,'Ankit',2);

SELECT * FROM managers;

SELECT
e.emp_name AS Employee,
m.emp_name AS Manager
FROM managers e
LEFT JOIN managers m
ON e.manager_id=m.emp_id;

