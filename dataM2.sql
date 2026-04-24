
-- FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY

SELECT c.customer_name,
SUM(o.total_amount)
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 250
GROUP BY c.customer_name
HAVING SUM(o.total_amount) > 100
ORDER BY SUM(o.total_amount) DESC;

-- 2. Write five SQL queries demonstrating Data Definition Language (DDL) operations.

create database shop_smart;

use shop_smart;

create table  customers(
 customer_id INT PRIMARY KEY AUTO_INCREMENT,
 customer_name VARCHAR(100),
 email VARCHAR(100)
 );
 
 create table products(
 product_id INT PRIMARY KEY AUTO_INCREMENT,
 product_name VARCHAR(100),
 price DECIMAL(10,2)
 );
 
 create table orders(
 order_id INT PRIMARY KEY AUTO_INCREMENT,
 product_id INT,
 customer_id INT,
 order_date DATE,
 total_amount DECIMAL(10,2),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
 );


ALTER TABLE customers
MODIFY email varchar(90) NOT NULL;

ALTER TABLE products
ADD phone VARCHAR(15);

TRUNCATE TABLE orders;

-- 3. Provide three SQL queries illustrating Data Manipulation Language (DML) operations.

INSERT INTO customers (customer_name,email) values
('Mohit','sagemohit7@gmail.com'),
('Rohit','sagerohit7@gmail.com'),
('Aniket','titaniket@gmail.com'),
('Priyansh','priyansh7@gmail.com');

INSERT INTO products(product_name,price,phone)values
('Sugar',878,'9878767896'),
('Tea',675,'7898767889'),
('Rice',433,'4534566399');


UPDATE products
SET price=300
WHERE product_id=1;

DELETE FROM products
WHERE product_id=3;


INSERT INTO orders(customer_id,product_id,order_date,total_amount) VALUES
(1, 1, '2026-04-20', 300),
(2, 2, '2026-04-21', 675),
(3, 1, '2026-04-22', 300),
(4, 2, '2026-04-23', 675);


SELECT c.customer_name,p.product_name,o.order_date,o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;


-- 4.Create two tables and demonstrate the application of various types of SQL JOINs including
--  INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.
-- JOINS

-- INNER JOIN returns only matching records from both tables.

SELECT c.customer_name,p.product_name,o.order_date,o.total_amount
from orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

-- LEFT JOIN returns all records from left table (customers) + matching records from orders.

SELECT c.customer_name,o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;


-- RIGHT JOIN returns all records from right table (products) + matching orders

SELECT p.product_name,o.order_date
FROM products p
RIGHT JOIN orders o ON p.product_id =o.product_id;


-- Returns all records from both tables

SELECT c.customer_name,o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_name,o.order_date
FROM customers c
Right JOIN orders o ON c.customer_id = o.customer_id;


-- 5.Compile a comprehensive list of best practices for writing efficient and
--  maintainable SQL queries. explain with theory with examples

-- BEST PRACTICE

-- USING INDEX

CREATE INDEX idx_customer ON orders(customer_id);

-- AVOID *
SELECT customer_name FROM customers;

-- USE WHERE Filtering

-- USE Meaningful name

-- Normalize tables

-- USE Constraints

-- Avoid duplicate data

-- Write readable queries

SELECT product_name, price
FROM products
WHERE price > 1000;








