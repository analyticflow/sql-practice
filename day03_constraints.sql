USE school_db;

-- NOT NULL

CREATE TABLE stud (
	name VARCHAR(100) NOT NULL
    );

INSERT INTO stud
VALUES(NULL);	-- Error Code: 1048. Column 'name' cannot be null

CREATE TABLE uniquetable (
	email VARCHAR(50) UNIQUE
    );
    
INSERT INTO uniquetable
VALUES('abc@gmail.com'); -- Error Code: 1062. Duplicate entry 'abc@gmail.com' for key 'uniquetable.email'

CREATE TABLE primaryemps(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100)
);

USE school_db;

CREATE TABLE employees_contstraints (
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE
    );
    
INSERT INTO employees_contstraints
VALUES
(101,'Rahul','rahul@gmail.com'),
(102,'Keshav','keshav@gmail.com'),
(103,'Priya','priya@gmail.com');

SELECT * FROM employees_contstraints;

INSERT INTO employees_contstraints
VALUES(101,'Vishal','vishal@gmail.com'); -- Error Code: 1062. Duplicate entry '101' for key 'employees_contstraints.PRIMARY'

INSERT INTO employees_contstraints
VALUES(104, NULL, 'abc@gmail.com'); -- Error Code: 1048. Column 'emp_name' cannot be null

INSERT INTO employees_contstraints
VALUES
(105,'Ankit','rahul@gmail.com'); -- Error Code: 1062. Duplicate entry 'rahul@gmail.com' for key 'employees_contstraints.email'

DESC employees_contstraints;