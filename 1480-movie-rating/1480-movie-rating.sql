# Write your MySQL query statement below
(SELECT u.name results
FROM MovieRating mr, 
     Users u
WHERE mr.user_id = u.user_id
GROUP BY mr.user_id
ORDER BY COUNT(mr.rating) DESC,
         u.name ASC
LIMIT 1)
UNION ALL
(SELECT m.title results
FROM MovieRating mr,
     Movies m
WHERE mr.movie_id = m.movie_id AND
      EXTRACT(YEAR_MONTH FROM created_at) = '202002'
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC,
         m.title ASC
LIMIT 1);

-- SELECT EXTRACT(YEAR_MONTH FROM created_at)
-- FROM MovieRating;


