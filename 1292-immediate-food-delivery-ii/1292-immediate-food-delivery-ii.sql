# Write your MySQL query statement below
WITH cte
AS
(
SELECT *,
       FIRST_VALUE(order_date) OVER (PARTITION BY customer_id ORDER BY order_date ASC) first_order
FROM Delivery
)
SELECT ROUND((SUM(IF(order_date = customer_pref_delivery_date, 1, 0)) / COUNT(*)) * 100, 2) immediate_percentage
FROM cte
WHERE order_date = first_order;