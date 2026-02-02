# Write your MySQL query statement below
WITH 2_day_weather_cte
AS
(
SELECT *,
       LAG(temperature) OVER w prev_day_temp,
       DATE_SUB(recordDate, INTERVAL 1 DAY) prev_day_orig,
       LAG(recordDate) OVER w prev_day_in_table
FROM Weather
WINDOW w AS (ORDER BY recordDate ASC)
)
SELECT id Id
FROM 2_day_weather_cte
WHERE temperature > prev_day_temp AND
      prev_day_orig = prev_day_in_table;
