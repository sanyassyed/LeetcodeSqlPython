# Write your MySQL query statement below
WITH numPrevNextCte
AS
(
SELECT id,
       num,
       LAG(num) OVER w prev,
       LEAD(num) OVER w next
FROM Logs
WINDOW w AS (ORDER BY id ASC)
)
SELECT DISTINCT num ConsecutiveNums
FROM numPrevNextCte
WHERE num = prev AND num= next;