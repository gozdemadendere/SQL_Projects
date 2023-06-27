/*

SQL String Functions

We will explore 12 essential SQL string functions such as CONCAT, REPLACE, LEFT, RIGHT, UPPER, LOWER, LENGHT, SUBSTRING, TRIM, INSTR, REVERSE.

*/


-- Select all the full names of employees as "employee_fullname".
SELECT CONCAT(fname, " ", lname) AS employee_fullname
FROM employee;


-- Write a query to see the full names of authors (the same last name cannot appear more than once) and their addresses in a sentence. 
SELECT DISTINCT au_lname, au_fname, CONCAT(au_fname, " ", au_lname, "'s address is: ", address)  AS authors_address_info
FROM authors;


-- Change St. to Street in address field.
SELECT address, REPLACE(address, "St.", "Street") AS updated_address
FROM authors;


-- Change St. to Street, Av. to Avenue, Rd. to Road in address field.
SELECT address, REPLACE(REPLACE(REPLACE(address, "St.", "Street"), "Av.", "Avenue"),"Rd.", "Road") AS updated_address
FROM authors;


-- Select the hiring date without the time.
SELECT hire_date, LEFT(hire_date, 10) AS hire_date_cleaned
FROM employee;


-- Select hiring date and time as 2 separate columns.
SELECT hire_date, LEFT(hire_date, 10) AS hire_date_cleaned, RIGHT(hire_date, 8) AS hire_time_cleaned
FROM employee;


-- Select all the full names of employees as "employee_fullname", then convert it to uppercase.
SELECT UPPER(CONCAT(fname, " ", lname)) AS employee_fullname
FROM employee;


-- Select all the full names of employees as "employee_fullname", then convert it to lowercase.
SELECT LOWER(CONCAT(fname, " ", lname)) AS employee_fullname
FROM employee;


-- Select all the book titles, and their lenghts.
SELECT title, LENGTH(title) AS title_lenght
FROM titles;


-- Select the first 10 characters of all book titles.
SELECT SUBSTRING(title, 1, 10) AS short_title
FROM titles;


-- Remove leading and trailing spaces from address field.
SELECT TRIM(address) AS trimmed_address
FROM authors;


-- Remove the '?' character from title column.
SELECT title, TRIM(BOTH '?' FROM title) AS cleaned_title
FROM titles;


-- Return the position of 'cook' within the title column.
SELECT title, INSTR(title, 'cook') AS position
FROM titles;


-- Reverse the characters in title column.
SELECT REVERSE(title) AS reversed_title
FROM titles;


















