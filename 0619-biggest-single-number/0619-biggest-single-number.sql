# Write your MySQL query statement below
WITH single_occurances
AS
(
SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1
)
SELECT MAX(num) num
FROM single_occurances;