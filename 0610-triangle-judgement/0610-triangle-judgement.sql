# Write your MySQL query statement below
SELECT *,
       IF(x+y > z, IF(y+z > x, IF(z+x > y, 'Yes', 'No'), 'No'), 'No') triangle
FROM Triangle;