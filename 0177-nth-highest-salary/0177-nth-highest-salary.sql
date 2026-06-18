CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      WITH detailed_emp
      AS
      (
      SELECT *,
             DENSE_RANK() OVER (ORDER BY salary DESC) rnk
      FROM Employee
      )
      SELECT MAX(salary)
      FROM detailed_emp
      WHERE rnk = N
  );
END