-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        seat_id,
        free,
        LEAD(free) OVER(ORDER BY seat_id) AS prev,
        LAG(free) OVER(ORDER BY seat_id) AS nxt
    FROM Cinema
)
SELECT 
    seat_id
FROM cte
WHERE free = 1 AND nxt = 1 
OR free = 1 AND prev = 1 
ORDER BY seat_id