WITH all_prods
AS
(
SELECT DISTINCT product_id
FROM Products
),
detail_prods
AS
(
SELECT *,
       MAX(change_date) OVER (PARTITION BY product_id ORDER BY change_date DESC) latest_date
FROM Products
WHERE change_date <= '2019-08-16'
)
SELECT a.product_id,
       IFNULL(d.new_price, 10) price
FROM all_prods a LEFT JOIN
     detail_prods d ON a.product_id = d.product_id AND d.change_date = d.latest_date;