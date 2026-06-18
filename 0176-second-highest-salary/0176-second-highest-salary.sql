# Write your MySQL query statement below
-- SELECT MAX(salary) SecondHighestSalary
-- FROM Employee
-- WHERE salary NOT IN (SELECT MAX(salary) FROM Employee)
-- ;
WITH ranked_employee
AS
(
SELECT *,
       DENSE_RANK() OVER (ORDER BY salary DESC) rnk
FROM Employee
)
SELECT MAX(salary) SecondHighestSalary
FROM ranked_employee
WHERE rnk = 2;
