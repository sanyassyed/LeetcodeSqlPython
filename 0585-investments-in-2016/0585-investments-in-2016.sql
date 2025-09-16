# Write your MySQL query statement below
WITH detail_cte
AS
(
SELECT *,
       COUNT(*) OVER (PARTITION BY tiv_2015) same_tiv_2015,
       COUNT(*) OVER (PARTITION BY CONCAT(lat,lon)) same_loc
FROM Insurance
)
SELECT ROUND(SUM(tiv_2016), 2) tiv_2016
FROM detail_cte
WHERE same_tiv_2015 > 1 AND
      same_loc = 1;