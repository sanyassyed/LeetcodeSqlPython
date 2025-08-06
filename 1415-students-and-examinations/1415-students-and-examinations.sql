# Write your MySQL query statement below
SELECT s.student_id,
       s.student_name,
       su.subject_name,
       COUNT(e.subject_name) attended_exams
FROM Students s INNER JOIN
     Subjects su LEFT JOIN 
     Examinations e ON 
     e.student_id = s.student_id AND
     su.subject_name = e.subject_name
GROUP BY s.student_id,
    s.student_name,
    su.subject_name
ORDER BY s.student_id,
         su.subject_name;

