# Write your MySQL query statement below
-- WITH cte
-- As
-- (
-- SELECT *,
--        FIRST_VALUE(event_date) OVER w first_login,
--        LEAD(event_date, 1) OVER w next_login
-- FROM Activity
-- WINDOW w AS (PARTITION BY player_id ORDER BY event_date ASC)
-- )
-- SELECT ROUND(SUM(IF(next_login = DATE_ADD(event_date, INTERVAL 1 DAY), 1, 0)) / COUNT(*) , 2) fraction
-- FROM cte
-- WHERE first_login = event_date;

WITH cte
AS
(
SELECT player_id,
       MIN(event_date) first_date
FROM Activity
GROUP BY player_id
)
SELECT ROUND(SUM(IF(a.event_date = DATE_ADD(c.first_date, INTERVAL 1 DAY), 1, 0)) / COUNT(DISTINCT c.player_id), 2)  fraction
FROM Activity a,
     cte c
WHERE c.player_id = a.player_id;