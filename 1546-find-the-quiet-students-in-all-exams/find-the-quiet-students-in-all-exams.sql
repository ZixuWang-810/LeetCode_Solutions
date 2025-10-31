-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        *,
        RANK()OVER(
            PARTITION BY exam_id
            ORDER BY score
        ) AS low,
        RANK()OVER(
            PARTITION BY exam_id
            ORDER BY score DESC
        ) AS high
    FROM Exam
)
SELECT
    DISTINCT e.student_id,
    s.student_name
FROM Exam e
LEFT JOIN Student s
    USING(student_id)
WHERE e.student_id NOT IN(
    SELECT student_id
    FROM cte
    WHERE low = 1
    OR high = 1
)
ORDER BY 1