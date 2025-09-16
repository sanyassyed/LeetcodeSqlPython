# Write your MySQL query statement below
WITH cte_total
as
(
SELECT requester_id id,
       COUNT(*) friends
FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id id,
       COUNT(*) friends
FROM RequestAccepted
GROUP BY accepter_id
)
SELECT id,
       SUM(friends) num
FROM cte_total
GROUP BY id
ORDER BY SUM(friends) DESC
LIMIT 1;;
       