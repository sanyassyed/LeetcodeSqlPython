# Write your MySQL query statement below
WITH all_users
AS
(
SELECT requester_id id,
       COUNT(accepter_id) num
FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id id,
       COUNT(requester_id) num
FROM RequestAccepted
GROUP BY accepter_id
),
aggregated_users
AS
(
SELECT id,
       SUM(num) num
FROM all_users
GROUP BY id
),
ranked_users
AS
(
SELECT id,
       num,
       DENSE_RANK() OVER (ORDER BY num DESC) rnk
FROM aggregated_users
)
SELECT id,
       num
FROM ranked_users
WHERE rnk =1
;