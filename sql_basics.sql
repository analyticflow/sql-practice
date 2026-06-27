-- SQL Basics

CREATE DATABASE school_db; 

USE school_db;

CREATE TABLE students (
	student_id INT,
    name VARCHAR(100),
    age INT 
    );
    
INSERT INTO students
VALUES
(1, 'Rahul', 26),
(2, 'Keshav', 24),
(3, 'Vishal', 23);

SELECT * FROM students;

SELECT name, age FROM students;

INSERT INTO students 
VALUES(4, 'Rohan', 21);

UPDATE students
SET age = 22
WHERE student_id = 1;

SELECT * FROM students;

DELETE FROM students
WHERE student_id = 4;

SELECT * FROM students;

-- DESC (Describe Table)
DESC students;