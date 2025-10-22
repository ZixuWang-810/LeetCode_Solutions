-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        seat_id,
        free, 
        LAG(free) OVER (ORDER BY seat_id) AS prev_seat,
        LEAD(free) OVER(ORDER BY seat_id) AS next_seat
    FROM Cinema 
)
SELECT
    seat_id
FROM cte
WHERE free = 1 AND next_seat = 1
OR free = 1 AND prev_seat = 1
ORDER BY seat_id