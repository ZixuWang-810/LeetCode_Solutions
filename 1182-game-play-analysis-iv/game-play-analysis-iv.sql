-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        player_id,
        event_date,
        LEAD(event_date) OVER(
            PARTITION BY player_id ORDER BY event_date
        ) AS next_day
    FROM Activity
)

SELECT 
    ROUND(
        COUNT(DISTINCT player_id)::DECIMAL / 
        (SELECT COUNT(DISTINCT player_id) FROM Activity)::DECIMAL
        ,2
    ) AS fraction
FROM cte 
WHERE (player_id, event_date) IN (
    SELECT 
        player_id,
        MIN(event_date)
    FROM Activity
    GROUP BY player_id
)
AND next_day = event_date + 1