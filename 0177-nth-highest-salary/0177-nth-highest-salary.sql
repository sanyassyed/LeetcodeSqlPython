CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
    WITH ranked_salary
AS
(
SELECT salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) rnk
FROM Employee
)
SELECT MAX(salary) SecondHighestSalary
FROM ranked_salary
WHERE rnk = n
  );
END