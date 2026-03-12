# Write your MySQL query statement below
WITH all_users
AS
(
SELECT requester_id id
FROM RequestAccepted

UNION ALL
SELECT accepter_id id
FROM RequestAccepted

),
aggregated_users
AS
(
SELECT id,
       COUNT(id) num
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