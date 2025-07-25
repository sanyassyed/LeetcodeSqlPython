# Write your MySQL query statement below
WITH cte
AS
(
SELECT product_id,
       year,
       FIRST_VALUE(year) OVER (PARTITION BY product_id ORDER BY year ASC) first_year,
       quantity,
       price
FROM Sales
)
SELECT product_id,
       first_year,
       quantity,
       price
FROM cte
WHERE year = first_year;