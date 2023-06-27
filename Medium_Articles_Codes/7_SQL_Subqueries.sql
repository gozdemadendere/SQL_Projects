/*

SQL Subqueries

We will explore:
Using Subqueries in SELECT Statements
Using Subqueries in WHERE Clauses
Using Subqueries in FROM Clauses

*/

-- Display the order ids and the average order amount for all of the orders.
SELECT customer_id, (SELECT AVG(order_amount) FROM orders) AS average_order_amount
FROM customers;

-- Count orders by customer.
SELECT customer_name, (SELECT COUNT(*) FROM orders WHERE orders.customer_id = customers.customer_id) AS order_count
FROM customers;




-- Find customers with transaction value greater than 1000.
SELECT customer_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM transactions WHERE amount > 1000);

-- Display the book titles and their ytd sales for books published in USA.
SELECT title, ytd_sales
FROM titles
WHERE pub_id IN (SELECT pub_id FROM publishers WHERE country="USA");

-- Retrieve employees with the lowest salary:
SELECT employee_name, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);




-- Display the stor ids and their sales quantities for sales greater than 50.
SELECT stor_id, qty
FROM (SELECT stor_id, qty FROM sales WHERE qty > 50) AS temp_table;


