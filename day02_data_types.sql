USE school_db;

CREATE TABLE employees (
	emp_id INT,
    emp_name VARCHAR(100),
    salary DECIMAL(10, 2),
    joining_date DATE,
    is_active BOOLEAN
);

INSERT INTO employees
VALUES
(101, 'Rahul', 45000.50, '2024-01-05', TRUE),
(102, 'Keshav', 38000.00, '2023-08-20', TRUE),
(103, 'Priya', 50000.75, '2022-11-01', FALSE); 

SELECT * FROM employees;

DESC employees;

CREATE TABLE products (
	product_code CHAR(5)
    );

INSERT INTO products
VALUES ('A12');

SELECT * FROM products;

DROP TABLE products;

CREATE TABLE feedback (
	review TEXT
    );
    
INSERT INTO feedback
VALUES ('The service was excellent and the staff was very helpful...');

SELECT * FROM feedback;

CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(50),
    product_code CHAR(5),
    price DECIMAL(8,2),
    weight FLOAT,
    description TEXT
    );
    
INSERT INTO products
VALUES
(1, 'Laptop', 'L1001', 65000.99, 2.35,
'15-inch laptop with 16GB RAM and 512GB SSD');

SELECT * FROM products;

DESC products;


