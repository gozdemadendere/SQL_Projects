/*

SQL Date & Time Functions

W will explore the most commonly used SQL Date & Time Functions such as DATE(), TIME(), EXTRACT(), YEAR(), MONTH(), DAY(), NOW(), CURRENT_DATE, CURRENT_TIME, DATE_FORMAT(), TIMESTAMPDIFF(), DATE_ADD(), DATE_SUB(), STR_TO_DATE(), WEEKDAY().

*/


-- Extract the date from hire_date column.
SELECT DATE(hire_date), hire_date
FROM employee;


-- Extract the time and date from hire_date column.
SELECT TIME(hire_date), DATE(hire_date), hire_date
FROM employee;


-- Extract the year, month, day from hire_date column.
SELECT EXTRACT(YEAR FROM hire_date) as year, EXTRACT(MONTH FROM hire_date) as month, EXTRACT(DAY FROM hire_date) as day, hire_date
FROM employee;


-- Extract the year, month, day from hire_date column.
SELECT YEAR(hire_date) AS year, MONTH(hire_date) AS month, DAY(hire_date) AS day, hire_date
FROM employee;


-- Display the current date and time.
SELECT NOW(), CURRENT_DATE, CURRENT_TIME, CURDATE(), CURTIME();


-- Format: 01 Jan 2023
SELECT DATE_FORMAT(LEFT(hire_date, 10), "%d %b %Y") AS hiring_date_cleaned
FROM employee;


-- Format: 01 January 2023
SELECT DATE_FORMAT(LEFT(hire_date, 10), "%d %M %Y") AS hiring_date_cleaned
FROM employee;


-- Format: 01 Jan 2023 Monday
SELECT DATE_FORMAT(LEFT(hire_date, 10), "%d %b %y %W" ) AS hiring_date_cleaned
FROM employee;


-- Find out how many YEARS an employee has worked there.
SELECT emp_id, TIMESTAMPDIFF(YEAR, hire_date, CURRENT_DATE) AS employee_workingtime, hire_date
FROM employee
ORDER BY employee_workingtime DESC;


-- Find out how many MONTHS an employee has worked there.
SELECT emp_id, TIMESTAMPDIFF(MONTH, hire_date, CURRENT_DATE) AS employee_workingtime, hire_date
FROM employee
ORDER BY employee_workingtime DESC;


-- Find out how many DAYS an employee has worked there.
SELECT emp_id, DATEDIFF(CURRENT_DATE, hire_date) AS employee_workingtime, hire_date
FROM employee
ORDER BY employee_workingtime DESC;


-- Subtract 2 months from hire_date column.
SELECT DATE_ADD(hire_date, INTERVAL -2 MONTH), hire_date
FROM employee;


-- Add 3 hours to hire_date column.
SELECT DATE_ADD(hire_date, INTERVAL 3 HOUR), hire_date
FROM employee;


-- Subtract 2 months from hire_date column.
SELECT DATE_SUB(hire_date, INTERVAL 2 MONTH), hire_date
FROM employee;


-- Subtract 3 hours from hire_date column.
SELECT DATE_SUB(hire_date, INTERVAL 3 HOUR), hire_date
FROM employee;


SELECT STR_TO_DATE('May 17, 2022', '%M %d, %Y');
-- Output: 2023–05–17


SELECT STR_TO_DATE(hire_date, '"%d %M %Y');
-- Output: 01 January 2023


-- Find out what day employees started to work there.
SELECT WEEKDAY(hire_date), hire_date
FROM employee;












