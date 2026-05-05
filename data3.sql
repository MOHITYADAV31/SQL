-- =========================
-- DATABASE
-- =========================
CREATE DATABASE company_system;
USE company_system;

-- =========================
-- TABLES (DDL)
-- =========================
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    dept_id INT,
    salary INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- =========================
-- INSERT DEPARTMENTS
-- =========================
INSERT INTO departments VALUES
(1,'HR','Delhi'),
(2,'IT','Bangalore'),
(3,'Finance','Mumbai');

-- =========================
-- INSERT 30 EMPLOYEES
-- =========================
INSERT INTO employees VALUES
(1,'Rohit',25,'Bhopal',2,50000),
(2,'Aman',28,'Indore',1,40000),
(3,'Neha',26,'Delhi',3,45000),
(4,'Priya',29,'Mumbai',2,60000),
(5,'Karan',24,'Pune',1,35000),
(6,'Ankit',30,'Jaipur',3,70000),
(7,'Simran',27,'Chennai',2,55000),
(8,'Rahul',28,'Kolkata',1,48000),
(9,'Pooja',26,'Lucknow',3,52000),
(10,'Vikas',25,'Surat',2,50000),
(11,'Nisha',27,'Nagpur',1,47000),
(12,'Arjun',29,'Noida',3,62000),
(13,'Meena',26,'Agra',2,51000),
(14,'Deepak',30,'Kanpur',1,45000),
(15,'Kavita',28,'Patna',3,53000),
(16,'Suresh',27,'Ranchi',2,60000),
(17,'Ritika',25,'Bhopal',1,40000),
(18,'Tarun',24,'Indore',3,38000),
(19,'Komal',28,'Delhi',2,57000),
(20,'Harsh',29,'Mumbai',1,49000),
(21,'Payal',26,'Pune',3,52000),
(22,'Gaurav',30,'Jaipur',2,61000),
(23,'Shreya',27,'Chennai',1,45000),
(24,'Abhishek',28,'Kolkata',3,58000),
(25,'Tanya',26,'Lucknow',2,50000),
(26,'Mohit',25,'Surat',1,42000),
(27,'Divya',27,'Nagpur',3,53000),
(28,'Yash',29,'Noida',2,62000),
(29,'Anjali',26,'Agra',1,41000),
(30,'Manish',30,'Kanpur',3,70000);

-- =========================
-- DDL QUERIES
-- =========================
ALTER TABLE employees ADD email VARCHAR(50);
ALTER TABLE employees MODIFY email VARCHAR(100);
ALTER TABLE employees DROP COLUMN email;

CREATE TABLE projects(id INT, name VARCHAR(50));
ALTER TABLE projects ADD budget INT;
ALTER TABLE projects DROP COLUMN budget;
DROP TABLE projects;

CREATE TABLE temp(id INT);
RENAME TABLE temp TO temp_new;
DROP TABLE temp_new;

-- =========================
-- DML QUERIES
-- =========================
SELECT * FROM employees;
SELECT emp_name, salary FROM employees;
SELECT * FROM employees WHERE salary > 50000;
SELECT * FROM employees WHERE city='Bhopal';

SELECT COUNT(*) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;

SELECT DISTINCT city FROM employees;

SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees LIMIT 5;

SELECT * FROM employees WHERE emp_name LIKE 'R%';

UPDATE employees SET salary=80000 WHERE emp_id=1;
DELETE FROM employees WHERE emp_id=30;

-- =========================
-- JOIN QUERIES
-- =========================
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id;

SELECT e.emp_name, d.location
FROM employees e
LEFT JOIN departments d
ON e.dept_id=d.dept_id;

SELECT e.emp_name
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
WHERE d.dept_name='IT';

SELECT d.location, COUNT(*)
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
GROUP BY d.location;

-- =========================
-- SUBQUERIES
-- =========================
SELECT * FROM employees
WHERE salary=(SELECT MAX(salary) FROM employees);

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT emp_name FROM employees
WHERE dept_id=(SELECT dept_id FROM departments WHERE dept_name='HR');

SELECT * FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE city='Bhopal');

SELECT * FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);