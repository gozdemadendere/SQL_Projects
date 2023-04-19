/*

PUBLICATIONS Data Exploration

The main purpose of the this project is to answer the business questions.

In this project, I analyzed a real-world dataset gaining the following skills:
* SQL syntax and how to use SQL: This part includes SELECT, SELECT DISTINCT, WHERE, NOT, AND, OR, IN, LIKE, wildcards, NULL, IS NOT NULL, ORDER BY.
* SQL Aggregation: This part includes COUNT, COUNT DISTINCT, SUM, AVG, MAX, MIN, GROUP BY, and HAVING.
* SQL Analysis: This is where I thought analytically and answer many analytical questions using advanced SQL techniques. This part includes JOINS, CASE statements.

*/

USE publications;

-- How many publishers are based in the USA but not based in Chicago?

SELECT COUNT(DISTINCT pub_id)
FROM publishers
WHERE NOT city = "Chicago" AND country = "USA";


--  What's the average price and year-to-date sales of the categories "business" and "popular_comp"?

SELECT type, AVG(price), MAX(ytd_sales)
FROM titles
WHERE type IN("business", "popular_comp")
GROUP BY type;


-- What's the price of the most expensive psychology book?

SELECT title, price
FROM titles
WHERE type = "psychology" 
ORDER BY price DESC
LIMIT 1;


-- Select the name and address of all stores located in an Avenue or in a Street (address ended in "St.")

SELECT stor_name, stor_address
FROM stores
WHERE (stor_address LIKE "%Ave.") OR (stor_address LIKE "%St."); 


-- Select all books that have an "ing" in the title, with at least 4 other characters preceding it.

SELECT title
FROM titles
WHERE title LIKE "%____ing%";


-- Select all the orders between 1993-03-11 and 1994-09-13

SELECT ord_num
FROM sales
WHERE ord_date BETWEEN "1993-03-11" AND "1994-09-13";


-- What's the price of the most expensive title from each publisher?

SELECT pub_id, MAX(price)
FROM titles
GROUP BY pub_id
ORDER BY MAX(price) DESC;


-- Find out the top 3 stores with the most sales

SELECT stor_id, SUM(qty)
FROM sales
GROUP BY stor_id
ORDER BY SUM(qty) DESC
LIMIT 3;


-- For each type (business, psychology…), find out how many books each publisher has.

SELECT pub_id, COUNT(title_id)
FROM titles
GROUP BY pub_id
ORDER BY COUNT(title_id) DESC;


-- Add the average price of each publisher - book type combination from your previous query, keep only the combinations of publisher - book type with an average price higher than 12

SELECT pub_id, COUNT(title_id), AVG(price)
FROM titles
GROUP BY pub_id
HAVING AVG(price) > 12
ORDER BY COUNT(title_id) DESC;


-- Select the top 5 orders with most quantity sold between 1993-03-11 and 1994-09-13 from the table sale

SELECT ord_num, qty
FROM sales
WHERE ord_date BETWEEN "1993-03-11" AND "1994-09-13"
ORDER BY qty DESC
LIMIT 5;



-- Select all store names, their store id and the discounts they offer. Don't show the stores that they don't offer any discount.

SELECT stor_id, discount, stor_name
FROM discounts
RIGHT JOIN stores
USING (stor_id)
WHERE discount IS NOT NULL;



-- Select the full name, job description and publisher name of employees that work for Binnet & Hardley.

SELECT fname,lname,job_desc,pub_name
FROM employee
LEFT JOIN jobs
USING (job_id)
LEFT JOIN publishers
USING (pub_id)
WHERE pub_name= "Binnet & Hardley";


/* Select everything from the sales table and create a new column called  "sales_category" with case conditions to categorise qty:
   
		qty >= 50 high sales
		20 <= qty < 50 medium sales
		qty < 20 low sales
*/

SELECT *,
CASE
WHEN qty >= 50 THEN "high sales"
WHEN 20 <= qty < 50 THEN "medium sales"
WHEN qty < 20 THEN "low sales"
END AS "sales_category"
FROM sales;


-- Adding to your answer from the previous question. Find out the total amount of books sold (qty) in each sales category i.e.
-- How many books had high sales, how many had medium sales, and how many had low sales

SELECT SUM(qty),
CASE
WHEN qty >= 50 THEN "high sales"
WHEN 20 <= qty < 50 THEN "medium sales"
WHEN qty < 20 THEN "low sales"
END AS "sales_category"
FROM sales
GROUP BY sales_category;
    
    

-- Adding to your answer from the previous questions: output only those sales categories that have a SUM(qty) greater than 100, and order them in descending order.

SELECT SUM(qty),
CASE
WHEN qty >= 50 THEN "high sales"
WHEN 20 <= qty < 50 THEN "medium sales"
WHEN qty < 20 THEN "low sales"
END AS "sales_category"
FROM sales
GROUP BY sales_category
HAVING SUM(qty) > 100
ORDER BY SUM(qty) DESC;




/* Find out the average book price, per publisher, for the following book types and price categories:
		- Book types: business, traditional cook and psychology
		- Price categories: <= 5 super low, <= 10 low, <= 15 medium, > 15 high
		- When displaying the average prices, use ROUND() to hide decimals. */


SELECT pub_name, type, ROUND(AVG(price),2)  as average_price,
CASE
WHEN price <= 5 THEN "super low"
WHEN price <= 10 THEN "low"
WHEN price <= 15 THEN "super low"
END AS price_category
FROM publishers
LEFT JOIN titles
USING (pub_id)
WHERE type IN("business", "trad_cook", "psychology")
GROUP BY pub_name, type, price_category;









