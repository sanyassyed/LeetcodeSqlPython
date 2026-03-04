# Write your MySQL query statement below
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;


-- WITH order_count_cte
-- AS
-- (
-- SELECT customer_number,
--        COUNT(order_number) total_orders
-- FROM Orders
-- GROUP BY customer_number
-- ),
-- customer_ranked
-- AS
-- (
-- SELECT customer_number,
--        DENSE_RANK() OVER (ORDER BY total_orders DESC) rnk
-- FROM order_count_cte
-- )
-- SELECT customer_number
-- FROM customer_ranked
-- WHERE rnk = 1;