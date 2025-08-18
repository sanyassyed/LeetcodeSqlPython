# Write your MySQL query statement below
-- WITH cte
-- AS
-- (
-- SELECT *,
--        FIRST_VALUE(order_date) OVER (PARTITION BY customer_id ORDER BY order_date ASC) first_order
-- FROM Delivery
-- )
-- SELECT ROUND((SUM(IF(order_date = customer_pref_delivery_date, 1, 0)) / COUNT(*)) * 100, 2) immediate_percentage
-- FROM cte
-- WHERE order_date = first_order;

-- ROUND((SUM(IF(d.order_date = d.customer_pref_delivery_date, 1, 0)) / COUNT(*) ) * 100 , 2) immediate_percentage,

WITH cte
AS
(
SELECT customer_id,
       MIN(order_date) first_order
FROM Delivery
GROUP BY customer_id
)
SELECT ROUND((SUM(IF(d.order_date = d.customer_pref_delivery_date, 1, 0)) / COUNT(*)) * 100 , 2) immediate_percentage
FROM Delivery d,
     cte c
WHERE d.order_date = c.first_order AND c.customer_id = d.customer_id;
