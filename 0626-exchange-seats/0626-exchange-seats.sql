# Write your MySQL query statement below
WITH detail_seat_cte
AS
(
SELECT *,
       LEAD(student) OVER w next,
       LAG(student) OVER w prev
FROM Seat
WINDOW w AS (ORDER BY id ASC)
)
SELECT id,
       IFNULL(IF(id%2 = 0, prev, next), student) student
FROM detail_seat_cte
ORDER BY id ASC;