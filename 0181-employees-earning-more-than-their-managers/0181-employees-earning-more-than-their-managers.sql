# Write your MySQL query statement below
SELECT e.name Employee
FROM Employee e,
     Employee m
WHERE e.ManagerId = m.id AND
      e.salary > m.salary;