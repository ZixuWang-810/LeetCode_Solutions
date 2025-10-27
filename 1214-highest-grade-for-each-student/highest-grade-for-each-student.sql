-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        student_id,
        course_id,
        grade
    FROM Enrollments
    WHERE (student_id, grade) IN (
        SELECT
            student_id,
            MAX(grade)
        FROM Enrollments
        GROUP BY 1
    )
    ORDER BY course_id
)
SELECT
    student_id,
    course_id,
    grade
FROM cte 
WHERE (student_id, course_id) IN (
    SELECT
        student_id,
        MIN(course_id)
    FROM cte
    GROUP BY 1
)
ORDER BY student_id