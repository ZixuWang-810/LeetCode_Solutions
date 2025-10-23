-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        x,
        LEAD(X) OVER(ORDER BY x) AS next_x
    FROM Point
    ORDER BY x
)
SELECT MIN(ABS(next_x - x)) AS shortest
FROM cte