


-- How many authors live in either San Jose or Salt Lake City

SELECT COUNT(au_id)
FROM authors
WHERE (city = "San Jose" OR city = "Salt Lake City");

-- OR

SELECT COUNT(au_id)
FROM authors
WHERE city IN ("San Jose", "Salt Lake City"); 



--  Which category of books has had more year-to-date sales, "business" or "popular_comp"?

SELECT MAX(ytd_sales), type
FROM titles
WHERE type IN("business" ,"popular_comp")
GROUP BY type;



-- Select the name and address of all stores located in an Avenue or in a Street (address ended in "St.")

SELECT stor_name, stor_address
FROM stores
WHERE (stor_address LIKE "%Ave.") OR (stor_address LIKE "%St."); 



-- Some authors have a contract, while others don't - it's indicated in the "contract" column of the authors table. 
-- Select all the states and cities where there are 2 or more contracts overall

SELECT state, city, SUM(contract)
FROM authors
GROUP BY state, city
HAVING SUM(contract) > 1;



-- In California, how many authors are there in cities that contain an "o" in the name?
-- Show only results for cities with more than 1 author. Sort the cities ascendingly by author count.

SELECT city, COUNT(au_id)
FROM authors
WHERE (state="CA") AND (city LIKE "%o")
GROUP BY city
HAVING COUNT(au_id) > 1
ORDER BY COUNT(au_id) DESC;



-- How many publishers are based in the USA?

SELECT COUNT(DISTINCT pub_id)
FROM publishers
WHERE country = "USA";


-- Select the title and publisher name of all books

SELECT title, pub_name
FROM titles
LEFT JOIN publishers
USING (pub_id);


-- Select the name and PR Info (from the pub_info table) from all publishers based in Berkeley, California.

SELECT pub_name,pr_info
FROM publishers
LEFT JOIN pub_info
USING (pub_id)
WHERE city IN("Berkeley)") AND state = "CA";


-- Find out the total amount of books sold (qty) in each sales category i.e.
-- How many books had high sales, how many had medium sales, and how many had low sales

SELECT SUM(qty),
CASE
WHEN qty >= 50 THEN "high sales"
WHEN 20 <= qty < 50 THEN "medium sales"
WHEN qty < 20 THEN "low sales"
END AS "sales_category"
FROM sales
GROUP BY sales_category;

