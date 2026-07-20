--  CREATE PROCEDURE
--  CALL PROCEDURE
--  Procedure with IN Parameter
--  DROP PROCEDURE

USE school_db;

-- Create Table

CREATE TABLE employees_procedure(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert Data

INSERT INTO employees_procedure
VALUES
(101,'Rahul','IT',50000),
(102,'Keshav','HR',42000),
(103,'Priya','Finance',65000),
(104,'Ankit','IT',52000),
(105,'Neha','Marketing',47000);

SELECT * FROM employees_procedure;

-- Procedure Without Parameters


DELIMITER //

CREATE PROCEDURE ShowEmployees()
BEGIN
    SELECT *
    FROM employees_procedure;
END //

DELIMITER ;

CALL ShowEmployees();


-- Procedure With IN Parameter


DELIMITER //

CREATE PROCEDURE GetDepartmentEmployees(IN p_department VARCHAR(50))
BEGIN
    SELECT *
    FROM employees_procedure
    WHERE department = p_department;
END //

DELIMITER ;

CALL GetDepartmentEmployees('IT');

CALL GetDepartmentEmployees('Finance');


-- Procedure to Show High Salary Employees


DELIMITER //

CREATE PROCEDURE HighSalaryEmployees()
BEGIN
    SELECT *
    FROM employees_procedure
    WHERE salary > 50000;
END //

DELIMITER ;

CALL HighSalaryEmployees();


-- Show All Stored Procedures


SHOW PROCEDURE STATUS
WHERE Db = 'school_db';


-- Drop Procedure


DROP PROCEDURE HighSalaryEmployees;

SHOW PROCEDURE STATUS
WHERE Db = 'school_db';