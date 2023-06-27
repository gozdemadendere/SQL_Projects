/*

SQL Joins

We will explore the most commonly used SQL Joins such as Inner, Left, Right, and Cross Join.

*/

-- First, let’s create 2 tables and insert some sample data:

CREATE DATABASE sample_db;
USE sample_db;

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  department_id INT
);

CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50)
);

INSERT INTO employees (employee_id, first_name, last_name, department_id)
VALUES
  (1, 'John', 'Doe', 1),
  (2, 'Jane', 'Smith', 1),
  (3, 'Michael', 'Johnson', 2),
  (4, 'Emily', 'Williams', NULL);

INSERT INTO departments (department_id, department_name)
VALUES
  (1, 'Sales'),
  (2, 'Marketing'),
  (3, 'Finance');
  
  
  
  
-- Select employee's id, full name, department name. 
-- Display common records in employees and departments tables.

SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;

-- Or
SELECT employee_id, first_name, last_name, department_name
FROM employees
JOIN departments
USING (department_id);
  
  
  
-- Select employee's id, full name, department name. 
-- Display all records from employees table, and matching records from departments table.


SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;

-- Or
SELECT employee_id, first_name, last_name, department_name
FROM employees
LEFT JOIN departments
USING (department_id);
  
  
  
-- Select employee's id, full name, department name. 
-- Display all records from departments table, and matching records from employees table.

SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.department_id;

-- Or
SELECT employee_id, first_name, last_name, department_name
FROM employees
RIGHT JOIN departments
USING (department_id);  
  
  
  
SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
CROSS JOIN departments;  
  
  
-- Display the UNIQUE department id's from both employees and departments tables.

SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;
  
  
-- Display the MATCHING department id's from employees and departments tables.

SELECT department_id
FROM employees
INNER JOIN departments
USING (department_id);


SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;






  
  