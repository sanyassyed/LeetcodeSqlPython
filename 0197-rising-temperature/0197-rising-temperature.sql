# Write your MySQL query statement below
SELECT w1.id id
FROM Weather w1,
     Weather w2
WHERE w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY) AND
      w2.temperature < w1.temperature; 