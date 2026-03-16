# Write your MySQL query statement below
WITH detailed_tree
AS
(
SELECT p.id,
       p.p_id,
       COUNT(c.id) children
FROM Tree p LEFT JOIN
     Tree c ON p.id = c.p_id
GROUP BY p.id,
         p.p_id
)
SELECT id,
       CASE 
       WHEN p_id IS NULL THEN 'Root'
       WHEN children = 0 THEN 'Leaf'
       ELSE 'Inner'
       END type
FROM detailed_tree
       ;