/*
SQL Practice - Advanced Querying
*/

-- Create Employee Table

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    Experience INT
);

-- Insert Sample Data

INSERT INTO Employees VALUES
(1,'Alice','HR',45000,2),
(2,'Bob','IT',70000,5),
(3,'Charlie','IT',80000,7),
(4,'David','Finance',65000,4),
(5,'Eva','HR',50000,3);

--------------------------------------------------
-- Q1. Display employees earning more than 60000.
--------------------------------------------------

SELECT *
FROM Employees
WHERE Salary > 60000;

--------------------------------------------------
-- Q2. Find the average salary of each department.
--------------------------------------------------

SELECT Department,
AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY Department;

--------------------------------------------------
-- Q3. Find employees whose salary is above the average salary.
--------------------------------------------------

SELECT Name, Salary
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);

--------------------------------------------------
-- Q4. Display employees ordered by salary (Highest First).
--------------------------------------------------

SELECT *
FROM Employees
ORDER BY Salary DESC;

--------------------------------------------------
-- Q5. Find the department with the highest average salary.
--------------------------------------------------

SELECT Department,
AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
ORDER BY AvgSalary DESC
LIMIT 1;