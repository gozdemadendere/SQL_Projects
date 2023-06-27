
/*

SQL Temporary Tables

*/


-- I'd like to show this query's result as a temporary table.
-- (It shows book's titles and publisher's country.)

SELECT title, country
FROM titles
LEFT JOIN publishers
USING (pub_id);




-- Let's create a temporary table as 'titles_publishers'.

CREATE TEMPORARY TABLE titles_publishers
SELECT title, country
FROM titles
LEFT JOIN publishers
USING (pub_id);

-- Let's retrieve all the data from the temporary table 'titles_publishers'.

SELECT *
FROM titles_publishers;




-- Display book's titles and publisher's country where title starts with 'The'.

SELECT *
FROM titles_publishers
WHERE title LIKE 'The%';




-- Display book's titles and publisher's country where title starts with 'The'.

SELECT titles_publishers.title, titles.price
FROM titles_publishers
LEFT JOIN titles
ON titles_publishers.title = titles.title;




DROP TABLE titles_publishers;

























