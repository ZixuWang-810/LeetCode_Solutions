-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT *
    FROM Students s
    CROSS JOIN Subjects sub
)

SELECT 
    c.student_id,
    c.student_name,
    c.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Examinations e
RIGHT JOIN cte c
    ON c.student_id = e.student_id
    AND c.subject_name = e.subject_name
GROUP BY c.student_id, c.student_name, c.subject_name
ORDER BY c.student_id, c.subject_name
