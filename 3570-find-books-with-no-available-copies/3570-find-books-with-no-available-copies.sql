# Write your MySQL query statement below

WITH books_out
AS
(
SELECT book_id,
        COUNT(*) total_borrowed
FROM borrowing_records 
WHERE return_date IS NULL
GROUP BY book_id
)
SELECT l.book_id,
       l.title,
       l.author,
       l.genre,
       l.publication_year,
       b.total_borrowed current_borrowers
FROM library_books l,
     books_out b
WHERE l.book_id = b.book_id AND
      l.total_copies = b.total_borrowed
ORDER BY b.total_borrowed DESC,
         l.title ASC;