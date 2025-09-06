# Write your MySQL query statement below
WITH grouped_cte
AS
(
SELECT visited_on,
       SUM(amount) amount
FROM Customer
GROUP BY visited_on
),
detail_customer
AS
(
SELECT *,
       SUM(amount) OVER w cumm_sum,
       AVG(amount) OVER w cumm_avg,
       COUNT(visited_on) OVER w cumm_count
FROM grouped_cte
WINDOW w AS (ORDER BY visited_on ASC RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)
ORDER BY visited_on
)
SELECT visited_on,
       cumm_sum amount,
       ROUND(cumm_avg, 2) average_amount
FROM detail_customer
WHERE cumm_count = 7
ORDER BY visited_on ASC;

