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


-- Show employees whose salary is more than ₹50,000.

DELIMITER //

CREATE PROCEDURE EmployeesAbove50000()
BEGIN
    SELECT *
    FROM employees_procedure
    WHERE salary > 50000;
END //

DELIMITER ;

CALL EmployeesAbove50000();


-- Returns employees earning ₹50,000 or more, sorted from highest salary to lowest salary.
DELIMITER //

CREATE PROCEDURE EmployeesBySalary()
BEGIN
    SELECT *
    FROM employees_procedure
    WHERE salary >= 50000
    ORDER BY salary DESC;
END //

DELIMITER ;

CALL EmployeesBySalary();


-- Show all IT employees sorted by salary in descending order.

DELIMITER //

CREATE PROCEDURE ITEmployeesDescending()
BEGIN
    SELECT *
    FROM employees_procedure
    WHERE department='IT'
    ORDER BY salary DESC;
END //

DELIMITER ;

CALL ITEmployeesDescending();


-- Show employees whose salary is between ₹45,000 and ₹60,000.

DELIMITER //

CREATE PROCEDURE SalaryBetween45k60k()
BEGIN
    SELECT *
    FROM employees_procedure
    WHERE salary BETWEEN 45000 AND 60000;
END //

DELIMITER ;

CALL SalaryBetween45k60k();


-- Show the total number of employees in each department.

DELIMITER //

CREATE PROCEDURE EmployeeCountDepartmentWise()
BEGIN
    SELECT
        department,
        COUNT(*) AS Total_Employees
    FROM employees_procedure
    GROUP BY department;
END //

DELIMITER ;

CALL EmployeeCountDepartmentWise();


-- Show employees whose salary is greater than the average salary.

DELIMITER //

CREATE PROCEDURE EmployeesAboveAverageSalary()
BEGIN
    SELECT *
    FROM employees_procedure
    WHERE salary >
    (
        SELECT AVG(salary)
        FROM employees_procedure
    );
END //

DELIMITER ;

CALL EmployeesAboveAverageSalary();