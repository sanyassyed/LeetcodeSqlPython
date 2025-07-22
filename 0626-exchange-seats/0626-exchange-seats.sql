# Write your MySQL query statement below
WITH cte
AS
(
SELECT *,
       IF(id % 2 = 0, id - 1 , id + 1) next_id
FROM Seat
)
SELECT c.id,
       IFNULL(s.student, c.student) student
FROM cte c
     LEFT JOIN
     Seat s 
     ON c.next_id = s.id;