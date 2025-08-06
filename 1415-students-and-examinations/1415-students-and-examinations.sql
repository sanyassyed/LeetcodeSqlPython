# Write your MySQL query statement below
WITH cte 
AS
(
SELECT s.student_id,
       s.student_name,
       su.subject_name
FROM Students s,
     Subjects su
)
SELECT c.student_id,
       c.student_name,
       c.subject_name,
       COUNT(e.subject_name) attended_exams
FROM cte c LEFT JOIN
     Examinations e 
     ON c. student_id = e.student_id AND
        c.subject_name = e.subject_name
GROUP BY c.student_id,
         c.student_name,
         c.subject_name
ORDER BY c.student_id,
         c.subject_name;