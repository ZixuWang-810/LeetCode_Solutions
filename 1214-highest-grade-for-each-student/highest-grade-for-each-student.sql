-- Write your PostgreSQL query statement below
SELECT
    student_id,
    MIN(course_id) AS course_id,
    grade
FROM Enrollments
WHERE (student_id, grade) IN (
    SELECT
        student_id,
        MAX(grade)
    FROM Enrollments
    GROUP BY 1
)
GROUP BY 1, 3
ORDER BY 1