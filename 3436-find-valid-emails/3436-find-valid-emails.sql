# Write your MySQL query statement below
SELECT *
FROM Users
WHERE REGEXP_LIKE(email, '^[a-zA-Z0-9_]+@{1}[a-zA-Z]+\\.com$')
ORDER BY user_id ASC;