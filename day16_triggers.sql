USE school_db;

CREATE TABLE employees_trigger(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees_trigger
VALUES
(101,'Rahul',50000),
(102,'Keshav',42000),
(103,'Priya',65000);

SELECT * FROM employees_trigger;

CREATE TABLE salary_logs(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER salary_update_log
AFTER UPDATE
ON employees_trigger
FOR EACH ROW
BEGIN
    INSERT INTO salary_logs(emp_id, old_salary, new_salary)
    VALUES(OLD.emp_id, OLD.salary, NEW.salary);
END //

DELIMITER ;

UPDATE employees_trigger
SET salary = 55000
WHERE emp_id = 101;

SELECT * FROM employees_trigger;

SELECT * FROM salary_logs;

CREATE TABLE employee_delete_logs(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER employee_delete_log
AFTER DELETE
ON employees_trigger
FOR EACH ROW
BEGIN
    INSERT INTO employee_delete_logs(emp_id, emp_name, salary)
    VALUES(OLD.emp_id, OLD.emp_name, OLD.salary);
END //

DELIMITER ;

DELETE FROM employees_trigger
WHERE emp_id = 102;

SELECT * FROM employees_trigger;

SELECT * FROM employee_delete_logs;

SHOW TRIGGERS;

DROP TRIGGER salary_update_log;

SHOW TRIGGERS;

DELIMITER //

CREATE TRIGGER EmployeesAbove50000
AFTER INSERT
ON employees_trigger
FOR EACH ROW
BEGIN
    IF NEW.salary > 50000 THEN
        INSERT INTO salary_logs(emp_id, old_salary, new_salary)
        VALUES(NEW.emp_id, 0, NEW.salary);
    END IF;
END //

DELIMITER ;

INSERT INTO employees_trigger
VALUES
(104,'Ankit',70000);

SELECT * FROM salary_logs;

DELIMITER //

CREATE TRIGGER PreventNegativeSalary
BEFORE UPDATE
ON employees_trigger
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;

UPDATE employees_trigger
SET salary = -1000
WHERE emp_id = 103;