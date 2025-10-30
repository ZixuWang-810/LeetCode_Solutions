-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        *,
        RANK() OVER(
            PARTITION BY exam_id ORDER BY score DESC
        ) top_rank,
        RANK() OVER(
            PARTITION BY exam_id ORDER BY score
        ) low_rank
    FROM Exam
)
SELECT 
    DISTINCT e.student_id,
    s.student_name
FROM Exam e
LEFT JOIN Student s
    USING (student_id)
WHERE e.student_id NOT IN (
    SELECT
        student_id
    FROM cte 
    WHERE top_rank = 1
    OR low_rank = 1
)
ORDER BY 1