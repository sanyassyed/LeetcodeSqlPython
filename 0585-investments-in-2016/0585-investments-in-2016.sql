# Write your MySQL query statement below
WITH count_cte
AS
(
SELECT *,
       COUNT(pid) OVER (PARTITION BY tiv_2015) same_tiv_2015,
       COUNT(pid) OVER (PARTITION BY CONCAT(lat,'-',lon)) same_loc
FROM Insurance
)
SELECT ROUND(SUM(tiv_2016), 2) tiv_2016
FROM count_cte
WHERE same_tiv_2015 >=2 AND
      same_loc = 1;