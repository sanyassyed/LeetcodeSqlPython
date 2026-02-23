# Write your MySQL query statement below
WITH activity_detail
AS
(
SELECT player_id,
       event_date,
       FIRST_VALUE(event_date) OVER w first_login,
       LEAD(event_date) OVER w next_login
FROM Activity
WINDOW w AS (PARTITION BY player_id ORDER BY event_date ASC)
)
SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) fraction
FROM activity_detail
WHERE next_login = DATE_ADD(event_date, INTERVAL 1 DAY) AND
      event_date = first_login;