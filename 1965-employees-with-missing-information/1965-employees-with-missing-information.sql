# Write your MySQL query statement below
WITH cte
AS
(
SELECT e.employee_id
FROM Employees e LEFT JOIN Salaries s
     ON e.employee_id = s.employee_id
WHERE s.salary IS NULL
UNION
SELECT s.employee_id
FROM Employees e RIGHT JOIN Salaries s
     ON s.employee_id = e.employee_id
WHERE e.name IS NULL
)
SELECT employee_id
FROM cte
ORDER BY employee_id ASC;
;

