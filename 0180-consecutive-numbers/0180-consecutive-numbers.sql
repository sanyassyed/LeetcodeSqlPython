# Write your MySQL query statement below
WITH detailed_logs
AS
(
SELECT num,
       LAG(num) OVER  w prev,
       LEAD(num) OVER w next
FROM Logs
WINDOW w AS (ORDER BY id ASC)
)
SELECT DISTINCT num ConsecutiveNums
FROM detailed_logs
WHERE num = prev AND
      num = next;