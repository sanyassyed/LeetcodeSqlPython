# Write your MySQL query statement below
SELECT *
FROM Users
WHERE REGEXP_LIKE(mail COLLATE utf8_bin, '^[a-zA-Z]+[a-zA-Z0-9._-]*@leetcode\\.com$');