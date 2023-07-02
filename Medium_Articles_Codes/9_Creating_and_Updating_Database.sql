
/*

Creating and Updating a Database Using SQL

*/

-- Create the database
CREATE DATABASE mydatabase;

-- Use the database
USE mydatabase;



-- Create the customers table
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20)
);

-- Create the orders table
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create the stores table
CREATE TABLE stores (
  store_id INT PRIMARY KEY,
  store_name VARCHAR(50),
  location VARCHAR(100)
);




-- Insert sample values into the customers table
INSERT INTO customers (customer_id, customer_name, email, phone_number)
VALUES
  (1, 'John Doe', 'johndoe@example.com', '123-456-7890'),
  (2, 'Jane Smith', 'janesmith@example.com', '987-654-3210'),
  (3, 'Mike Johnson', 'mikejohnson@example.com', '555-555-5555');

-- Insert sample values into the orders table
INSERT INTO orders (order_id, customer_id, order_date, order_amount)
VALUES
  (1, 1, '2022-01-01', 100.00),
  (2, 1, '2022-02-15', 250.00),
  (3, 2, '2022-03-10', 150.00),
  (4, 3, '2022-04-20', 75.00);

-- Insert sample values into the stores table
INSERT INTO stores (store_id, store_name, location)
VALUES
  (1, 'Store A', 'New York'),
  (2, 'Store B', 'Los Angeles'),
  (3, 'Store C', 'Chicago');






-- Add a column called "address" to the "customers" table.

ALTER TABLE customers
ADD COLUMN address VARCHAR(100);



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

-- Delete the customer with customer_id=1 from the "customers" table.

DELETE
FROM customers
WHERE customer_id = 1;
-- Delete all the duplicate emails, keeping only one unique email with the smallest id.
-- Please write a DELETE statement and DO NOT write a SELECT statement.

DELETE p1
FROM Person as p1, Person as p2
WHERE p1.email = p2.email AND p1.id > p2.id;












