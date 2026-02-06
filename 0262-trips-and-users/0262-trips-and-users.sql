# Write your MySQL query statement below
WITH unbanned_user_trips
AS
(
SELECT t.*
FROM Trips t JOIN Users c ON t.client_id = c.users_id AND c.banned = 'No'
             JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'No'
WHERE t.request_at BETWEEN "2013-10-01" AND "2013-10-03"
)
SELECT request_at Day,
       ROUND(SUM(IF(status LIKE '%cancelled%', 1, 0)) / COUNT(*), 2) `Cancellation Rate`
FROM unbanned_user_trips
GROUP BY request_at;