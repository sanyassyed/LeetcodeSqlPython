# Write your MySQL query statement below
SELECT MAX(salary) SecondHighestSalary
FROM Employee
WHERE salary != (SELECT MAX(salary) max_salary
FROM Employee);
