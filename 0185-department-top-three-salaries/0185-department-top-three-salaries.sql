# Write your MySQL query statement below
WITH ranked_cte
AS
(
SELECT departmentId,
       name,
       salary,
       DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) rnk
FROM Employee
)
SELECT d.name Department,
       e.name Employee,
       e.salary Salary
FROM ranked_cte e,
     Department d
WHERE d.id = e.departmentId AND rnk < 4;
       