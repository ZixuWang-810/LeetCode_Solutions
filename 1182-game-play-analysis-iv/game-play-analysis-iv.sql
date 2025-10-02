WITH cte AS (
    SELECT
        player_id,
        event_date,
        lead(event_date) OVER(
            PARTITION BY player_id
            ORDER BY event_date
        ) AS next_date,
        RANK() OVER(
            PARTITION BY player_id
            ORDER BY event_date
        ) AS date_rank
    FROM Activity
)

SELECT
    ROUND(
        COUNT(player_id) ::DECIMAL/
        (SELECT COUNT(DISTINCT player_id) FROM Activity) ::DECIMAL
        ,2
    ) AS fraction
FROM cte
WHERE 
    next_date = event_date + 1
    AND date_rank = 1