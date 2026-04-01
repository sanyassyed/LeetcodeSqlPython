# Write your MySQL query statement below
SELECT p.product_name,
       s.year,
       s.price
FROM Sales s,
     Product p
WHERE s.product_id = p.product_id
ORDER BY s.year ASC, p.product_name;