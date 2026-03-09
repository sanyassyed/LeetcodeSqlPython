# Write your MySQL query statement below
WITH detailed_stadium
AS
(
SELECT *,
       LEAD(id) OVER w next_1,
       LEAD(id, 2) OVER w next_2,
       LAG(id) OVER w prev_1,
       LAG(id, 2) OVER w prev_2
FROM Stadium
WHERE people >= 100
WINDOW w AS (ORDER BY id ASC)
)
SELECT id,
       visit_date,
       people
FROM detailed_stadium 
WHERE (next_1 = id + 1 AND
      next_2 = id + 2) OR
      (prev_1 = id-1 AND
      prev_2 = id - 2) OR
      (next_1 = id +1 AND
      prev_1 = id -1)
ORDER BY visit_date ASC;