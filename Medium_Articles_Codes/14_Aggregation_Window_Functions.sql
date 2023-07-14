
-- Let's create a table called “employees”:
CREATE TABLE employees (
  id integer,
  first_name varchar(20),
  last_name varchar(20),
  position varchar(20),
  salary varchar(20)
);

DROP TABLE employees;

-- Let's add some values to our table employees:
INSERT INTO employees VALUES 
(1, 'James', 'Flynn', 'Manager', 62000),
(2, 'Ajay', 'Ramoray', 'Manager', 62000),
(3, 'Ayse', 'Berry', 'Senior Manager', 98000),
(4, 'Gail', 'Edward', 'Associate', 50000),
(5, 'Maria', 'Frey', 'Senior Associate', 82000),
(6, 'Daniel', 'Lordman', 'Associate', 73000),
(7, 'Ferehsteh', 'Asmus', 'Senior Associate', 92000),
(8, 'Kalpana', 'Kumar', 'Manager', 86000),
(9, 'Peter', 'Ashley', 'Associate', 73000),
(10, 'Joanna', 'White', 'Senior Associate', 54000),
(11, 'Drake', 'Valley', 'Senior Associate', 54000);



-- Here’s how our employees table looks like:
SELECT *
FROM employees;




-- Find the total salary of employees for each department.
SELECT * ,
SUM(salary) OVER (PARTITION BY position) AS running_total
FROM employees;



-- Find the average salary of employees for each department.
SELECT * ,
AVG(salary) OVER (PARTITION BY position) AS running_avg
FROM employees;



-- Find the count of salaries of employees for each department.
SELECT * ,
COUNT(salary) OVER (PARTITION BY position) AS count
FROM employees;



-- Find the total salary, average salary, count of salaries of employees for each department, where salary is greater than 60000.
SELECT * ,
SUM(salary) OVER (PARTITION BY position) AS running_total,
AVG(salary) OVER (PARTITION BY position) AS running_avg,
COUNT(salary) OVER (PARTITION BY position) AS count
FROM employees
WHERE salary > 60000;




-- Suppose you want to calculate the running total salary for each salesperson.
SELECT CONCAT(first_name, ' ', last_name) AS full_name , 
SUM(salary) OVER (PARTITION BY (CONCAT(first_name, ' ', last_name)) ORDER BY salary) AS running_total
FROM employees;





