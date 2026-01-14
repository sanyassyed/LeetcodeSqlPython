# Write your MySQL query statement below
WITH logs_prev_next
AS
(
SELECT num,
       LEAD(num) OVER w next,
       LAG(num) OVER w prev
FROM Logs
WINDOW w AS (ORDER BY id ASC)
)
SELECT DISTINCT num ConsecutiveNums
FROM logs_prev_next
WHERE num = next AND
      num = prev;