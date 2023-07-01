

-- 1) Calculate the percentage contribution of each store to total sales.
SELECT stor_id, SUM(qty) AS total_qty, (SUM(qty) / (SELECT SUM(qty) FROM sales) * 100) AS percentage
FROM sales
GROUP BY stor_id
ORDER BY SUM(qty) DESC;



-- 2) Find the second expensive order in a table.
/* We can solve this question with ‘LIMIT OFFSET’ or with a Subquery.

Please note that:
- LIMIT: How many rows will be returned in the result set?
- OFFSET: How many rows will be skipped in the result set?
*/

-- Using LIMIT OFFSET

SELECT order_id, price
FROM order_items
ORDER BY price DESC
LIMIT 1 OFFSET 1; 


-- Using Subquery

SELECT MAX(price)
FROM order_items
WHERE price < (SELECT MAX(price) FROM order_items);


-- 3) Calculate the total sales for each store, considering only orders in the year 1993.
-- OPTION 1

SELECT stor_id, SUM(CASE WHEN YEAR(ord_date) = 1993 THEN qty ELSE 0 END) AS total_sales
FROM sales
GROUP BY stor_id;

-- OPTION 2

SELECT stor_id, SUM(qty)
FROM sales
WHERE YEAR(ord_date) = 1993
GROUP BY stor_id;


-- 4) Calculate the export and import for each company.
/*
Please note that:
If the company is a seller then it is an export.
If the company is a buyer then it is an import. */

SELECT country,
SUM(CASE WHEN companies.name = trades.seller THEN trades.value ELSE 0 END) AS export,
SUM(CASE WHEN companies.name = trades.buyer THEN trades.value ELSE 0 END) AS import
FROM companies
LEFT JOIN trades ON companies.name = trades.seller OR companies.name = trades.buyer
GROUP BY companies.country
ORDER BY companies.country ASC;


-- 5) Determine the month with the highest number of orders in the past year.
/* Please note that:
DATE_ADD() and DATE_SUB() perform addition or subtraction operations on date values.

Example: DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH) : shows 3 months before the current date. */

SELECT MONTH(ord_date), SUM(qty)
FROM sales
WHERE ord_date >= DATE_SUB(ord_date, INTERVAL 1 YEAR)
GROUP BY MONTH(ord_date)
ORDER BY SUM(qty) DESC
LIMIT 1;


-- 6) Find the books that have not been published in the last six months.

SELECT title, MONTH(pubdate), pubdate
FROM titles
WHERE pubdate IN (
    SELECT pubdate
    FROM titles
    WHERE pubdate < DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH)
);


-- 7) Calculate the cumulative sum of the quantity column in the table.
SELECT qty, SUM(qty) OVER (ORDER BY qty) AS cumulative_sum
FROM sales;


-- 8) Retrieve the most recent order for each store.
SELECT stor_id, MAX(ord_date) AS most_recent_order
FROM sales
GROUP BY stor_id
ORDER BY most_recent_order DESC;


-- 9) Calculate the average order amount for each month in the year 1993.
SELECT MONTH(ord_date) AS month, AVG(qty)
FROM sales
WHERE YEAR(ord_date) = 1993
GROUP BY month
ORDER BY AVG(qty) DESC;


-- 10) Find the stores that have sold at least 3 products in May 1993.
SELECT stor_id, SUM(qty)
FROM sales
WHERE MONTH(ord_date) = '05' AND YEAR(ord_date) = 1993
GROUP BY stor_id
ORDER BY SUM(qty) DESC;







