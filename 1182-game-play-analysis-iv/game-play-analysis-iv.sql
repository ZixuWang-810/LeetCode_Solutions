-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        player_id,
        event_date,
        LEAD(event_date) OVER(
            PARTITION BY player_id ORDER BY event_date
        ) AS next_date
    FROM Activity
)
, cte2 AS (
    SELECT 
        DISTINCT player_id
    FROM cte
    WHERE next_date = event_date + 1 
    AND (player_id,event_date) IN (
        SELECT 
            player_id,
            MIN(event_date)
        FROM cte
        GROUP BY 1
    )
)
SELECT 
    ROUND(
        COUNT(player_id) ::DECIMAL
        / (SELECT COUNT(DISTINCT player_id) FROM Activity) ::DECIMAL
        ,2
    ) AS fraction
FROM cte2