# Write your MySQL query statement below
WITH cte 
AS
(
SELECT requester_id id
FROM RequestAccepted
UNION ALL
SELECT accepter_id id
FROM RequestAccepted
)
SELECT id,
       COUNT(*) num
FROM cte
GROUP BY id
ORDER BY COUNT(*) DESC
LIMIT 1