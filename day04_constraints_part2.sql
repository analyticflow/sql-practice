-- 1. AUTO_INCREMENT
-- 2. DEFAULT
-- 3. CHECK
-- 4. FOREIGN KEY

USE school_db;

CREATE TABLE students_auto (
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50)
    );

INSERT INTO students_auto(student_name)
VALUES('Rahul'),('Abhi');

SELECT * FROM students_auto;

CREATE TABLE employees_default (
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50) DEFAULT 'IT'
    );

INSERT INTO employees_default(emp_name) 
VALUES ('Rahul'), ('Keshav');

SELECT * FROM employees_default;

INSERT INTO employees_default(emp_name , department)
VALUES('Karan', 'HR');

SELECT * FROM employees_default;

CREATE TABLE employees_check (
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50), 
	age INT CHECK(age >= 18)
    );

INSERT INTO employees_check
VALUES(101, 'Karn', 25);

INSERT INTO employees_check
VALUES(102, 'Trisha', 15); -- Error Code: 3819. Check constraint 'employees_check_chk_1' is violated.

CREATE TABLE departments(
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
    );

INSERT INTO departments
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

CREATE TABLE employees_fk(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT, 
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
    );
    
INSERT INTO employees_fk
VALUES 
(101, 'Rahul', 1),
(102, 'Karan', 2),
(103, 'Prem', 3);

INSERT INTO employees_fk
VALUES
(104,'Ankit',10); -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`school_db`.`employees_fk`, CONSTRAINT `employees_fk_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`))



