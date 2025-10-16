# Write your MySQL query statement below
SELECT p.product_name,
       SUM(o.unit) unit
FROM Orders o LEFT JOIN
     Products p ON p.product_id = o.product_id
WHERE EXTRACT(YEAR_MONTH FROM o.order_date) =  202002
GROUP BY p.product_name
HAVING SUM(o.unit) > 99;

