# Write your MySQL query statement below
WITH main_ids
AS
(
SELECT MIN(id) id
FROM Person
GROUP BY email
)
DELETE FROM
Person
WHERE id NOT IN (SELECT id FROM main_ids);