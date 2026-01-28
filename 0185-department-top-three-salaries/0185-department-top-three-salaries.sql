# Write your MySQL query statement below
WITH ranked_salary_cte
AS
(
SELECT d.name Department,
       e.name Employee,
       e.salary Salary,
       DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) rnk
FROM Employee e,
     Department d
WHERE e.departmentId = d.id
)
SELECT Department,
       Employee,
       Salary
FROM ranked_salary_cte
WHERE rnk <= 3;
