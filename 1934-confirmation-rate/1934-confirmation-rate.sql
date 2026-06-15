# Write your MySQL query statement below
SELECT s.user_id,
       ROUND(IFNULL(SUM(IF(action = "confirmed", 1, 0)) / COUNT(action), 0), 2) confirmation_rate
FROM Signups s LEFT JOIN confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id
