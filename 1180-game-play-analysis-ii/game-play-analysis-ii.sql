-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        *,
        RANK() OVER(
            PARTITION BY player_id 
            ORDER BY event_date
        ) AS rank
    FROM Activity
)
SELECT
    player_id, device_id
FROM cte
WHERE rank = 1