# Write your MySQL query statement below
WITH cte
AS
(
SELECT num,
       COUNT(*) total_occurance
FROM MyNumbers
GROUP BY num
)
SELECT MAX(num) num
FROM cte
WHERE total_occurance = 1;