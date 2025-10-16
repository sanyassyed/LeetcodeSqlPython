# Write your MySQL query statement below
WITH numbered_cte
AS
(SELECT id,
       ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) rw_num
FROM Person
)
DELETE FROM Person 
WHERE id IN (SELECT id 
FROM numbered_cte 
WHERE rw_num != 1);