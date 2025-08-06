# Write your MySQL query statement below
SELECT o.name
FROM Employee m,
     Employee o
WHERE m.managerId = o.id
GROUP BY m.managerId
HAVING COUNT(m.id) >= 5;