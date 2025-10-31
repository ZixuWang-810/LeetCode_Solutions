-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        x,
        LEAD(x) OVER(ORDER BY x) AS nxt
    FROM Point
    ORDER BY x
)
SELECT
    MIN(nxt - x) AS shortest
FROM cte