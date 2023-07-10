
/*

Advanced SQL Queries 

*/


-- Subqueries

-- Display the order ids and the average order amount for all of the orders.
SELECT customer_id, (SELECT AVG(order_amount) FROM orders) AS average_order_amount
FROM customers;

-- Find customers with transaction value greater than 1000.
SELECT customer_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM transactions WHERE amount > 1000);

-- Display the stor ids and their sales quantities for sales greater than 50.
SELECT stor_id, qty
FROM (SELECT stor_id, qty FROM sales WHERE qty > 50) AS temp_table;



--  Union

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

-- Joins

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



-- Window Functions
SELECT CustomerName, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (PARTITION BY CustomerName ORDER BY OrderDate) AS RunningTotal
FROM Orders;



-- Temporary Tables

-- Let's create a temporary table as 'titles_publishers'.
CREATE TEMPORARY TABLE titles_publishers
SELECT title, country
FROM titles
LEFT JOIN publishers
USING (pub_id);

-- Let's retrieve all the data from the temporary table 'titles_publishers'.
SELECT *
FROM titles_publishers;
CREATE TABLE #TempTable (
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

INSERT INTO #TempTable
SELECT CustomerID, OrderDate, TotalAmount
FROM Orders
WHERE OrderDate >= '2022-01-01';

SELECT * FROM #TempTable;



-- Conditional Aggregation
SELECT Category, COUNT(*) AS TotalProducts,
       SUM(CASE WHEN Price > 100 THEN 1 ELSE 0 END) AS ExpensiveProducts
FROM Products
GROUP BY Category;




-- String Manipulation

-- Select all the full names of employees as "employee_fullname".
SELECT CONCAT(fname, " ", lname) AS employee_fullname
FROM employee;

-- Change St. to Street in address field.
SELECT address, REPLACE(address, "St.", "Street") AS updated_address
FROM authors;

-- Select the first 10 characters of all book titles.
SELECT SUBSTRING(title, 1, 10) AS short_title
FROM titles;
