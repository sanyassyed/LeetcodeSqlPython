# Write your MySQL query statement below
WITH category_cte
AS
(
SELECT IF(income < 20000, 'Low Salary', IF(income > 50000, 'High Salary', 'Average Salary')) category
FROM Accounts
)
SELECT a.category,
       IFNULL(COUNT(c.category), 0) accounts_count
FROM category_cte c RIGHT JOIN (SELECT 'Low Salary' category UNION ALL SELECT 'High Salary' UNION ALL SELECT 'Average Salary') a
     ON c.category = a.category
GROUP BY category;


