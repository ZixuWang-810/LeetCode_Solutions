SELECT
    ROUND(
        COUNT(DISTINCT player_id)::DECIMAL
        /(SELECT COUNT(DISTINCT player_id) FROM Activity)::DECIMAL
        ,2
    ) AS fraction
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT
        player_id,
        MIN(event_date) + 1
    FROM Activity
    GROUP BY 1
)