-- Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
SELECT w1.id
FROM Weather AS w1, Weather AS w2
WHERE w1.recordDate-1 = w2.recordDate AND w1.temperature > w2.temperature;


-- Write an SQL query to find the employees who earn more than their managers.
SELECT e1.name AS Employee
FROM Employee AS e1
WHERE e1.salary > (SELECT e2.salary FROM Employee AS e2 WHERE e2.id = e1.managerid);


-- Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.
DELETE p1
FROM Person as p1, Person as p2
WHERE p1.email = p2.email AND p1.id > p2.id;


-- Write an SQL query to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
SELECT email AS Email
FROM Person 
GROUP BY email
HAVING COUNT(id) > 1;


-- Write an SQL query to report all the classes that have at least five students.
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student)>=5 ; 


-- Write an SQL query to report all customers who never order anything.
SELECT name AS Customers
FROM Customers
WHERE name NOT IN (SELECT name 
FROM Customers
RIGHT JOIN Orders
ON Customers.id = Orders.customerId);


-- Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring". Return the result table ordered by rating in descending order.
SELECT *
FROM Cinema
WHERE (description NOT LIKE '%boring%') AND (id%2!=0)
ORDER BY rating DESC;


-- Write an SQL query to report the first login date for each player.
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;


-- Write an SQL query to report the managers with at least five direct reports.
SELECT name
FROM Employee 
WHERE id IN (SELECT managerId FROM Employee GROUP BY managerId HAVING COUNT(managerId)>=5);


-- Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
SELECT customer_number
FROM (SELECT customer_number, COUNT(order_number) FROM Orders GROUP BY customer_number ORDER BY COUNT(order_number) DESC) AS customers
LIMIT 1;


--










