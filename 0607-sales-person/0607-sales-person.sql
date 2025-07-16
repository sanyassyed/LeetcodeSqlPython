# Write your MySQL query statement below
WITH cte
AS
(
SELECT o.sales_id,
       o.com_id
FROM Company c,
     Orders o
WHERE c.com_id = o.com_id AND
      c.name LIKE 'RED'
)
SELECT name
FROM SalesPerson s   
WHERE sales_id NOT IN (SELECT DISTINCT sales_id FROM cte);
