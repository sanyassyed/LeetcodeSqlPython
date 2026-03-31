# Write your MySQL query statement below
WITH detail_seat
AS
(
SELECT *,
       LAG(id) OVER w prev,
       LEAD(id) OVER w next
FROM Seat
WINDOW w AS (ORDER BY id ASC)
)
SELECT IFNULL(IF(id%2 = 0, prev, next), id) id,
       student
FROM detail_seat
ORDER BY 1 ASC;