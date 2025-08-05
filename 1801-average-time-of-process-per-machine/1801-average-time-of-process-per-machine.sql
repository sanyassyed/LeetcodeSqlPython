# Write your MySQL query statement below
WITH cte 
AS
(
SELECT machine_id,
       process_id,
       SUM(IF(activity_type LIKE 'start', timestamp * -1, timestamp)) processing_time
FROM Activity
GROUP BY machine_id, 
         process_id
)
SELECT machine_id,
       ROUND(AVG(processing_time),3) processing_time
FROM cte
GROUP BY machine_id;