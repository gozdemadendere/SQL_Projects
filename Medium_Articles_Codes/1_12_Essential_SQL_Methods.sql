/*

12 Essential SQL Methods

We’ll cover SELECT, SELECT DISTINCT, WHERE, NOT, AND, OR, IN, LIKE, BETWEEN, ORDER BY, NULL, IS NOT NULL.

*/



-- Select all the first names of employees as "employee_firstname", and employee id's as "employee_id".

SELECT fname AS employee_firstname, emp_id AS employee_id
FROM employee;


-- Write a query to see the full names of authors (the same person cannot appear more than once).

SELECT DISTINCT (CONCAT(au_fname, " ", au_lname))  AS authors_fullname
FROM authors;


-- How many stores are based in California state (CA)?

SELECT COUNT(DISTINCT stor_id)
FROM stores
WHERE state = "CA";


-- How many stores are NOT based in Washington state (WA)?

SELECT COUNT(DISTINCT stor_id)
FROM stores
WHERE NOT state = "WA";


-- Select first name, last name, and city from authors whose first name is "Dean" and whose city is either "Oakland" or "Berkeley".

SELECT au_fname, au_lname, city
FROM authors
WHERE (au_fname = "Dean") AND (city = "Oakland" OR "Berkeley");


-- How many publishers are based in the USA and based in a city that start with the letter B ?

SELECT COUNT(DISTINCT pub_id)
FROM publishers
WHERE (city LIKE "B%") AND (country = "USA");


-- Select first, last name, and city from authors whose city is "Oakland" or "Berkeley", and last name is NOT "Straight".

SELECT au_fname, au_lname, city
FROM authors
WHERE (city = "Oakland" OR "Berkeley") AND NOT au_lname = "Straight";


-- How many authors live in either San Jose or Salt Lake City or Berkeley?

SELECT COUNT(au_id)
FROM authors
WHERE city IN ("San Jose", "Salt Lake City", "Berkeley"); 



-- Select all the books from the table title that contain the word "cooking" in its title.

SELECT title
FROM titles
WHERE title LIKE '%cooking%';


-- Select all titles that start with the word "The".

SELECT title
FROM titles
WHERE title LIKE "The%";


-- Select the name and address of all stores located in an Avenue or in a Street (address ended in "St.")

SELECT stor_name, stor_address
FROM stores
WHERE (stor_address LIKE "%Ave.") OR (stor_address LIKE "%St."); 


-- Select all the order numbers with a quantity sold between 25 and 45 from the table sales.

SELECT ord_num, qty
FROM sales
WHERE qty BETWEEN 25 AND 45;


-- Select all the order numbers with order date between '1993-03-11' and '1994-09-13' from the table sales.

SELECT ord_num, ord_date
FROM sales
WHERE ord_date BETWEEN "1993-03-11" AND "1994-09-13";


-- Find out the top 3 stores with the most sales.

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


-- Retrieve the book titles whose price is missing or unknown.

SELECT title, price
FROM titles
WHERE price IS NULL;


-- Let's retrieve the book titles whose price is NOT missing or unknown.

SELECT title, price
FROM titles
WHERE price IS NOT NULL;


