/*

PUBLICATIONS Data Exploration

The main purpose of the this project is to answer the business questions.

In this project, I analyzed a real-world dataset gaining the following skills:
* SQL syntax and how to use SQL: This part includes SELECT, SELECT DISTINCT, WHERE, NOT, AND, OR, IN, LIKE, wildcards, NULL, IS NOT NULL, ORDER BY.
* SQL Aggregation: This part includes COUNT, COUNT DISTINCT, SUM, AVG, MAX, MIN, GROUP BY, and HAVING.
* SQL Analysis: This is where I thought analytically and answer many analytical questions using advanced SQL techniques. This part includes JOINS, CASE statements.

*/

USE publications;

/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
    - AS
	- DISTINCT
__________________________________________________________________
*/

-- Select the job id and job description of all jobs, but display the columns with the names "id" and "description"

SELECT job_id AS "id", job_desc AS "description"
FROM jobs;


-- Select all unique last names of authors (the same last name cannot appear more than once)

SELECT DISTINCT au_lname
FROM authors;
   

/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
    - WHERE
	- AND / OR / NOT
__________________________________________________________________    
*/


-- Select the order number and order date of all orders where exactly 20 books were sold

SELECT ord_num, ord_date, qty
FROM sales
WHERE qty = 20;


-- Select first and last name from authors whose last name is "Ringer" and first name is "Anne"

SELECT au_fname, au_lname
FROM authors
WHERE au_lname = "Ringer" AND au_fname = "Anne";


-- Select the name and city of publishers based in either Germany or France

SELECT  pub_name, city, country
FROM publishers
WHERE country = "Germany" OR "France";


-- Select first name, last name, and city from authors whose first name is "Dean" and whose city is either "Oakland" or "Berkeley"
-- HINT: parenthesis "()" can help

SELECT au_fname, au_lname, city
FROM authors
WHERE (au_fname = "Dean") AND (city = "Oakland" OR "Berkeley");


-- How many publishers are based in the USA but not based in Chicago?

SELECT COUNT(DISTINCT pub_id)
FROM publishers
WHERE NOT city = "Chicago" AND country = "USA";


-- Select first, last name, and city from authors whose city is "Oakland" or "Berkeley", and last name is NOT "Straight"*/
   
SELECT au_fname, au_lname, city
FROM authors
WHERE (city = "Oakland" OR "Berkeley") AND NOT au_lname = "Straight";
   

/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()
    - ROUND
__________________________________________________________________
*/

-- What's the maximum amount of books ever sold in a single order?

SELECT qty
FROM sales
ORDER BY qty DESC
LIMIT 1;

-- OR
SELECT MAX(qty)
FROM sales;


-- What's the price of the cheapest book?

SELECT MIN(price)
FROM titles;


-- In a single query, select the count, average and sum of quantity in the table sales

SELECT COUNT(qty), ROUND(AVG(qty),2) , SUM(qty)
FROM sales;


/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
	- SELECT FROM
    - AS
	- DISTINCT
	- WHERE
	- AND / OR / NOT
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()
__________________________________________________________________
*/


-- From how many different states are our authors?

SELECT COUNT(DISTINCT state)
FROM authors;


-- How many publishers are based in the USA?

SELECT COUNT(DISTINCT pub_id)
FROM publishers
WHERE country = "USA";


-- What's the average quantity of titles sold per sale by store 7131?

SELECT ROUND(AVG(qty),0)
FROM sales
WHERE stor_id = "7131";


-- When was the employee with the highest level hired?

SELECT hire_date
FROM employee
ORDER BY job_lvl DESC
LIMIT 1; 


-- What's the average price of psychology books?

SELECT AVG(price)
FROM titles
WHERE type = "psychology";

-- Which category of books has had more year-to-date sales, "business" or "popular_comp"? You can write two queries to answer this question.

SELECT MAX(ytd_sales), type
FROM titles
WHERE type IN("business" ,"popular_comp")
GROUP BY type;


-- What's the title and the price of the most expensive book?

SELECT title, price
FROM titles
ORDER BY price DESC
LIMIT 1;


-- What's the price of the most expensive psychology book?

SELECT title, price
FROM titles
WHERE type = "psychology"
ORDER BY price DESC
LIMIT 1;


-- How many authors live in either San Jose or Salt Lake City

SELECT COUNT(au_id)
FROM authors
WHERE (city = "San Jose" OR city = "Salt Lake City");

-- OR

SELECT COUNT(au_id)
FROM authors
WHERE city IN ("San Jose", "Salt Lake City"); 


/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
	- LIKE (%, _)
__________________________________________________________________
*/


-- Select all books from the table title that contain the word "cooking" in its title

SELECT title
FROM titles
WHERE title LIKE '%cooking%';


-- 2. Select all titles that start with the word "The"

SELECT title
FROM titles
WHERE title LIKE "The%";


-- 3. Select the full names (first and last name) of authors whose last name starts with "S"

SELECT au_fname, au_lname
FROM authors
WHERE au_lname LIKE "S%";


-- Select the name and address of all stores located in an Avenue (its address ends with "Ave.")

SELECT stor_name, stor_address
FROM stores
WHERE stor_address LIKE "%Ave.";


-- Select the name and address of all stores located in an Avenue or in a Street (address ended in "St.")

SELECT stor_name, stor_address
FROM stores
WHERE (stor_address LIKE "%Ave.") OR (stor_address LIKE "%St."); 


-- Look at the "employee" table (select all columns to explore the raw data): Find a pattern that reveals whether an employee is Female or Male. Select all female employees.

SELECT emp_id, fname,lname 
FROM employee WHERE emp_id
LIKE ('%F');


-- Select the first and last names of all male employees whose name starts with "P".
   
SELECT emp_id, fname, lname 
FROM employee 
WHERE emp_id 
LIKE ("%M") AND fname LIKE("P%");


-- Select all books that have an "ing" in the title, with at least 4 other characters preceding it. For example, 'cooking' has 4 characters before the
-- 'ing', so this should be included; 'sewing' has only 3 characters before the 'ing', so this shouldn't be included.

SELECT title
FROM titles
WHERE title LIKE "%____ing%";


/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
    - IN (NOT IN)
    - BETWEEN (AND)
    
The differences between =, LIKE and IN

= :   takes a single value to look for and matches only the exact value.

LIKE: takes a single to look for and allows wildcards (%, _) to match patterns in different positions.

IN :  takes many values to look for, such as a list of values, but does not work with the wildcards (%, _).
__________________________________________________________________
*/

-- Using "IN", select all titles of type "psychology", "mod_cook" and "trad_cook"

SELECT title, type
FROM titles
WHERE type IN("psychology", "mod_cook","trad_cook");


-- Select all the authors from the author table that do not come from the cities Salt Lake City, Ann Arbor, and Oakland.

SELECT au_id, city
FROM authors
WHERE city IN("Salt Lake City", "Ann Arbor", "Oakland");


-- Select all the order numbers with a quantity sold between 25 and 45 from the table sales

SELECT ord_num, qty
FROM sales
WHERE qty BETWEEN 25 AND 45;


-- Select all the orders between 1993-03-11 and 1994-09-13

SELECT ord_num
FROM sales
WHERE ord_date BETWEEN "1993-03-11" AND "1994-09-13";


-- Select all job descriptions with a maximum level ("max_lvl") between max_lvl and 200.

SELECT job_desc, max_lvl
FROM jobs
WHERE max_lvl BETWEEN 150 AND 200;


/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
    - GROUP BY
    - HAVING
    
The main difference between WHERE and HAVING is that:
    - the WHERE clause is used to specify a condition for filtering most records
    - the HAVING clause is used to specify a condition for filtering values from an aggregate (such as MAX(), AVG(), COUNT() etc...)
__________________________________________________________________
*/


-- Find the total amount of authors by each state and order them in descending order

SELECT state, COUNT(au_id)
FROM authors
GROUP BY state
ORDER BY COUNT(au_id) DESC;


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


-- Find the average job level for each job_id from the employees table. Order the jobs in ascending order by its average job level.

SELECT job_id, AVG(job_lvl)
FROM employee
GROUP BY job_id
ORDER BY AVG(job_lvl) DESC;


-- For each type (business, psychology…), find out how many books each publisher has.

SELECT pub_id, COUNT(title_id)
FROM titles
GROUP BY pub_id
ORDER BY COUNT(title_id) DESC;


-- Add the average price of each publisher - book type combination from your previous query

SELECT pub_id, COUNT(title_id), AVG(price)
FROM titles
GROUP BY pub_id
ORDER BY COUNT(title_id) DESC;


-- From your previous query, keep only the combinations of publisher - book type with an average price higher than 12

SELECT pub_id, COUNT(title_id), AVG(price)
FROM titles
GROUP BY pub_id
HAVING AVG(price) > 12
ORDER BY COUNT(title_id) DESC;


-- Order the results of your previous query by these two criteria:
-- Count of books, descendingly
-- Average price, descendingly

SELECT pub_id, COUNT(title_id), AVG(price)
FROM titles
GROUP BY pub_id
HAVING AVG(price) > 12
ORDER BY COUNT(title_id) DESC;


-- Some authors have a contract, while others don't - it's indicated in the "contract" column of the authors table. 
-- Select all the states and cities where there are 2 or more contracts overall

SELECT state, city, SUM(contract)
FROM authors
GROUP BY state, city
HAVING SUM(contract) > 1;


-- Select the top 5 orders with most quantity sold between 1993-03-11 and 1994-09-13 from the table sale

SELECT ord_num, qty
FROM sales
WHERE ord_date BETWEEN "1993-03-11" AND "1994-09-13"
ORDER BY qty DESC
LIMIT 5;


-- How many authors have an "i" in their first name, are from Utah, Maryland, or Kansas?

SELECT COUNT(au_fname)
FROM authors
WHERE (au_fname LIKE "%i%") AND (state IN ('CA', 'MD', 'KS'));



/* In California, how many authors are there in cities that contain an "o" in the name?
   - Show only results for cities with more than 1 author.
*/


SELECT city, COUNT(au_id)
FROM authors
WHERE (state="CA") AND (city LIKE "%o")
GROUP BY city
HAVING COUNT(au_id) > 1;


/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
	- AS
	- JOINS (LEFT JOIN / RIGHT JOIN / INNER JOIN)
    - USING
__________________________________________________________________
*/

-- Select the title and publisher name of all books

SELECT title, pub_name
FROM titles
LEFT JOIN publishers
USING (pub_id);


-- Select the order number, quantity and book title for all sales.

SELECT ord_num,qty,title
FROM sales
RIGHT JOIN titles
USING (title_id);


-- Select the full name of all employees and the name of the publisher they work for

SELECT e.fname, p.pub_name
FROM employee e
LEFT JOIN publishers p
ON e.pub_id = p.pub_id;


-- Select the full name, job description and publisher name of all employees

SELECT fname,lname,job_desc,pub_name
FROM employee
LEFT JOIN jobs
USING (job_id)
LEFT JOIN publishers
USING (pub_id);

    
-- Select the full name, job description and publisher name of employees that work for Binnet & Hardley.

SELECT fname,lname,job_desc,pub_name
FROM employee
LEFT JOIN jobs
USING (job_id)
LEFT JOIN publishers
USING (pub_id)
WHERE pub_name="Binnet & Hardley";


-- Select the name and PR Info (from the pub_info table) from all publishers based in Berkeley, California.

SELECT pub_name,pr_info
FROM publishers
LEFT JOIN pub_info
USING (pub_id)
WHERE city IN("Berkeley)") AND state = "CA";


-- Select all columns from the discounts table. Observe the columns it has and now some of them are filled with NULL values.

SELECT * FROM discounts;

/* Select all store names, their store id and the discounts they offer.

       - ALL stores should be displayed, even if they don't offer any discount 
         (i.e. have a NULL value on the discount column). */
         
         
SELECT stor_id, discount, stor_name
FROM discounts
RIGHT JOIN stores
USING (stor_id);


-- Select all store names, their store id and the discounts they offer. Don't show the stores that they don't offer any discount.

SELECT stor_id, discount, stor_name
FROM discounts
RIGHT JOIN stores
USING (stor_id)
WHERE discount IS NOT NULL;


/*
__________________________________________________________________
In the solutions below I will use the following clauses/operators:
	- CASE
__________________________________________________________________
*/


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


