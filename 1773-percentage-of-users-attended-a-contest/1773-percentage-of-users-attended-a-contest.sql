# Write your MySQL query statement below
SELECT contest_id,
       ROUND((COUNT(user_id) / (SELECT COUNT(DISTINCT user_id) FROM Users)) * 100, 2 ) percentage
FROM Register
GROUP BY contest_id
ORDER BY 2 desc,
         contest_id ASC;