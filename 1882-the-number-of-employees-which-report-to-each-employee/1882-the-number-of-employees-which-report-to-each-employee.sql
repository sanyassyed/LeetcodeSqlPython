# Write your MySQL query statement below
SELECT m.reports_to employee_id,
       e.name,
       COUNT(m.employee_id) reports_count,
       ROUND(AVG(m.age)) average_age
FROM Employees m,
     Employees e
WHERE m.reports_to = e.employee_id
GROUP BY m.reports_to
HAVING COUNT(m.employee_id) >= 1
ORDER BY m.reports_to;