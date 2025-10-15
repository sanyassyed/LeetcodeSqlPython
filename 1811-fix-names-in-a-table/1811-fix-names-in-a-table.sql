# Write your MySQL query statement below
SELECT user_id,
       CONCAT(upper(left(name, 1)), lower(substr(name, 2))) name
FROM Users
ORDER BY user_id ASC;