/*

Data Cleaning in SQL

*/

-- 1. Check for Missing Values

SELECT order_id, order_status, order_delivered_carrier_date
FROM orders
WHERE order_delivered_carrier_date IS NULL;


SELECT order_id, order_status, COALESCE(order_delivered_carrier_date, 'Unknown') AS filled_column
FROM orders;




-- 2. Check for Duplicate Rows

SELECT order_id, customer_id, COUNT(*)
FROM orders
GROUP BY order_id, customer_id
HAVING COUNT(*) > 1;


-- Select all the unique emails.
SELECT DISTINCT email
FROM Person;


-- Delete all the duplicate emails, keeping only one unique email with the smallest id.
DELETE p1
FROM Person as p1, Person as p2
WHERE p1.email = p2.email AND p1.id > p2.id;




-- 3. Standardizing and Transforming Data

SELECT product_id, UPPER(product_category_name) AS uppercase_column
FROM products;


-- Change St. to Street in address field.
SELECT address, REPLACE(address, "St.", "Street") AS updated_address
FROM authors;

-- Select the first 10 characters of all book titles.
SELECT SUBSTRING(title, 1, 10) AS short_title
FROM titles;


-- Remove leading and trailing spaces from address field.
SELECT TRIM(address) AS trimmed_address
FROM authors;

SELECT ord_num, ord_date, DATE_FORMAT(ord_date, "%d %M %Y") AS formatted_date
FROM sales;


SELECT SUM(qty),
CASE
WHEN qty >= 50 THEN "high sales"
WHEN 20 <= qty < 50 THEN "medium sales"
WHEN qty < 20 THEN "low sales"
END AS "sales_category"
FROM sales
GROUP BY sales_category;



-- 4. Updating Data / Column Data Types

-- Update the email of the customer with customer_id 1.
UPDATE customers
SET email = 'john.doe@example.com'
WHERE customer_id = 1;


-- Swap 'New York' to 'NY' , 'Los Angeles' to 'LA' , 'Chicago' to 'CH'.
-- Please write a single update statement and no intermediate temporary tables.
UPDATE stores
SET location =
  CASE
    WHEN location = 'New York' THEN 'NY'
    WHEN location = 'Los Angeles' THEN 'LA'
    WHEN location = 'Chicago' THEN 'CH'
  END;


-- Change the data type of the "address" column to "INT".
ALTER TABLE customers
MODIFY COLUMN address INT;


-- Drop the "address" column from the "customers" table.
ALTER TABLE customers
DROP COLUMN address;










