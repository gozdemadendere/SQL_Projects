/*

SQL Aggregation Functions

We’ll cover COUNT, COUNT DISTINCT, SUM, AVG, MAX, MIN, ROUND, GROUP BY, ORDER BY, HAVING, WITH ROLLUP.

NOTE - The order should be like this:
GROUP BY ...
HAVING ...
ORDER BY ...


NOTE - We should write city twice:
WHERE (city = "San Jose") OR (city = "Salt Lake City")

*/


-- How many rows are in the authors table?

SELECT COUNT(*) AS total_rows
FROM authors;


-- How many authors are in the dataset?

SELECT COUNT(DISTINCT au_id) AS number_of_authors
FROM authors;


-- How many authors live in either San Jose or Salt Lake City?   *****

SELECT COUNT(DISTINCT au_id)
FROM authors
WHERE city IN("San Jose", "Salt Lake City");

SELECT COUNT(DISTINCT au_id)
FROM authors
WHERE (city = "San Jose") OR (city = "Salt Lake City");


-- How many stores are based in California state (CA)?

SELECT COUNT(DISTINCT stor_id) AS "number of stores in CA"
FROM stores
WHERE state = "CA";


-- Find out the total sales by quantity.

SELECT SUM(qty) AS sales_quantity
FROM sales;


-- Find out sales by quantity for each store, then sort in descending order.

SELECT stor_id, SUM(qty) AS sales_quantity
FROM sales
GROUP BY stor_id
ORDER BY SUM(qty) DESC;


-- Display the count, average and sum of quantity in the table sales.

SELECT COUNT(qty), AVG(qty) , SUM(qty)
FROM sales;


-- Find out how many books each publisher has and their average price of books.

SELECT pub_id, COUNT(title_id), AVG(price)
FROM titles
GROUP BY pub_id
ORDER BY COUNT(title_id) DESC;


-- Find out the minimum price of the books for each publisher.

SELECT pub_id,  MIN(price) AS minimum_price
FROM titles
GROUP BY pub_id;


-- Find out the maximum price of the books for each publisher.

SELECT pub_id, MAX(price) AS maximum_price
FROM titles
GROUP BY pub_id;



-- Find out the average price of the books for each publisher, show them with 2 decimals.

SELECT pub_id,  ROUND(AVG(price),2) AS average_book_price
FROM titles
GROUP BY pub_id;


-- Find out total YTD sales for each publisher, then sort in descending order.

SELECT pub_id,  SUM(ytd_sales)
FROM titles
GROUP BY pub_id
ORDER BY SUM(ytd_sales) DESC;


-- Find out total YTD sales for each publisher and each title, then sort in descending order.

SELECT pub_id, title, SUM(ytd_sales)
FROM titles
GROUP BY pub_id, title
ORDER BY SUM(ytd_sales) DESC;


-- Find out average price for each publisher and each title, then sort in descending order.     *****
-- Additionally, display the subtotals and grand total using WITH ROLLUP.

SELECT pub_id, title, AVG(price)
FROM titles
GROUP BY pub_id, title
ORDER BY AVG(price) DESC;

SELECT pub_id, title, AVG(price)
FROM titles
GROUP BY pub_id, title
WITH ROLLUP;


-- Find out the top 3 stores with the most sales.

SELECT stor_id, SUM(qty)
FROM sales
GROUP BY stor_id
ORDER BY SUM(qty) DESC
LIMIT 3;



-- Select stores with more than 50 sales quantity, then sort them in descending order.  *****

SELECT stor_id, SUM(qty)
FROM sales
GROUP BY stor_id
HAVING SUM(qty) > 50
ORDER BY SUM(qty) DESC;


















