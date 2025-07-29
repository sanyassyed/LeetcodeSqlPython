# Write your MySQL query statement below
SELECT DISTINCT s.product_id,
       p.product_name
FROM Sales s,
     Product p
WHERE s.product_id = p.product_id AND sale_date BETWEEN '2019-01-01' and '2019-03-31' AND s.product_id NOT IN (SELECT distinct product_id FROM Sales WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31');