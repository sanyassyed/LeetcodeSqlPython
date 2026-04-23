# Write your MySQL query statement below
WITH stores_with_variety
AS
(
SELECT store_id
FROM inventory
GROUP BY store_id
HAVING COUNT(DISTINCT product_name) >= 3
),
detailed_inventory
AS
(
SELECT *,
       FIRST_VALUE(price) OVER w_big expensive_prod_price,
       FIRST_VALUE(product_name) OVER w_big expensive_prod,
       FIRST_VALUE(quantity) OVER w_big expensive_prod_quantity,
       FIRST_VALUE(price) OVER w_small cheap_prod_price,
       FIRST_VALUE(product_name) OVER w_small cheap_prod,
       FIRST_VALUE(quantity) OVER w_small cheap_prod_quantity
FROM inventory
WHERE store_id IN (SELECT DISTINCT store_id FROM stores_with_variety)
WINDOW w_big AS (PARTITION BY store_id ORDER BY price DESC),
       w_small AS (PARTITION BY store_id ORDER BY price ASC)
),
filtered_inventory
AS
(
SELECT store_id,
       expensive_prod,
       expensive_prod_price,
       expensive_prod_quantity,
       cheap_prod,
       cheap_prod_price,
       cheap_prod_quantity
FROM detailed_inventory
GROUP BY store_id
)
SELECT i.store_id,
       s.store_name,
       s.location,
       i.expensive_prod most_exp_product,
       i.cheap_prod cheapest_product,
       ROUND((i.cheap_prod_quantity / i.expensive_prod_quantity), 2) imbalance_ratio
FROM filtered_inventory i,
     stores s
WHERE i.store_id = s.store_id AND 
      ROUND((i.cheap_prod_quantity / i.expensive_prod_quantity), 2) > 1
ORDER BY imbalance_ratio DESC,
         s.store_name ASC;

