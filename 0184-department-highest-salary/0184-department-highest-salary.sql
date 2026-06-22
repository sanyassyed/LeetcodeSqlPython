# Write your MySQL query statement below
WITH ranked_employee
AS
(
SELECT name Employee,
       departmentId,
       salary Salary,
       DENSE_RANK() OVER (PARTITION BY departmentID ORDER BY salary DESC) rnk
FROM Employee
)
SELECT d.name Department,
       r.Employee,
       r.Salary
FROM ranked_employee r,
     Department d
WHERE r.departmentId = d.id AND
      r.rnk = 1;