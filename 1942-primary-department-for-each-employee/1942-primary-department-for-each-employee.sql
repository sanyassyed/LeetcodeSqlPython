# Write your MySQL query statement below
WITH cte
as
(
SELECT employee_id,
       department_id,
       primary_flag,
       COUNT(*) OVER (PARTITION BY employee_id) total_departments
FROM Employee
)
SELECT employee_id,
       department_id
FROM cte
WHERE total_departments = 1 OR (total_departments != 1 AND primary_flag = 'Y');
