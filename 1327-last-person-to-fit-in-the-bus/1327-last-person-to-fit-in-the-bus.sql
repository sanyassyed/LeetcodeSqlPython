# Write your MySQL query statement below
WITH total_weights_cte
AS
(SELECT *,
       SUM(weight) OVER (ORDER BY turn ASC) cumm_weight
FROM Queue
)
SELECT person_name
FROM total_weights_cte
WHERE cumm_weight <= 1000
ORDER BY turn DESC
LIMIT 1;