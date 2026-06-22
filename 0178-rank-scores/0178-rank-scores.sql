# Write your MySQL query statement below
SELECT score,
       DENSE_RANK() OVER (order by score DESC) `rank`
FROM Scores
ORDER BY 2 ASC;