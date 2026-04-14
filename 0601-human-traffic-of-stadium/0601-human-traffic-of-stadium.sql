# Write your MySQL query statement below
WITH cte
As
(
SELECT *,
       LAG(id) OVER w before_1,
       LAG(id, 2) OVER w before_2,
       LEAD(id) OVER w next_1,
       LEAD(id, 2) OVER w next_2
FROM Stadium
WHERE people >= 100
WINDOW w AS (ORDER BY id ASC)
ORDER BY id ASC
)
SELECT id,
                visit_date,
                people
FROM cte
WHERE (before_1 = id -1 AND before_2 = id - 2) OR
      (before_1 = id-1 AND next_1 = id +1) OR 
      (next_2 = id+2 AND next_1 = id +1);