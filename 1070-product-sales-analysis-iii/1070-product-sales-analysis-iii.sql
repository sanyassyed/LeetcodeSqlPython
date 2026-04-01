# Write your MySQL query statement below
WITH Sales_with_first_year
AS
(
SELECT *,
       MIN(year) OVER (PARTITION BY product_id ORDER BY year ASC) first_year
FROM Sales
)
SELECT product_id,
       first_year,
       quantity,
       price
FROM Sales_with_first_year
WHERE year=first_year;