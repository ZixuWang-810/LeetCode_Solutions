-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        p.project_id,
        p.employee_id,
        RANK()OVER(
            PARTITION BY p.project_id
            ORDER BY e.experience_years DESC
        ) AS rank 
    FROM Project p
    LEFT JOIN Employee e
        USING (employee_id)
)
SELECT
    project_id,
    employee_id
FROM cte
WHERE rank = 1