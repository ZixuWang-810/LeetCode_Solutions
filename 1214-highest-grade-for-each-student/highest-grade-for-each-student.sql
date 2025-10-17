-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        student_id,
        course_id,
        grade,
        RANK() OVER(
	        PARTITION BY student_id 
	        ORDER BY grade DESC, course_id ASC
	       ) AS rank
    FROM Enrollments
)
SELECT
    student_id,
    course_id,
    grade
FROM cte
WHERE rank = 1
ORDER BY student_id