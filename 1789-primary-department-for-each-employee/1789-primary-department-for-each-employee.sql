# Write your MySQL query statement below
WITH detailed_emp
AS
(
SELECT *,
      COUNT(*) OVER (PARTITION BY employee_id) total_departments
FROM Employee
)
SELECT employee_id,
       department_id
FROM detailed_emp
WHERE primary_flag LIKE 'Y' OR total_departments = 1;