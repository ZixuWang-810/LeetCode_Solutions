-- Write your PostgreSQL query statement below
WITH fuck AS (
    SELECT
        player_id,
        event_date,
        LEAD(event_date) OVER(
            PARTITION BY player_id
            ORDER BY event_date
        ) nxt
    FROM Activity
)
, cte AS (
    SELECT
        *
    FROM fuck
    WHERE (player_id, event_date) IN (
        SELECT player_id, MIN(event_date)
        FROM fuck
        GROUP BY 1
    )
)
SELECT
    ROUND(
        COUNT(DISTINCT player_id)::DECIMAL 
        / (SELECT COUNT(DISTINCT player_id)::DECIMAL FROM Activity)
        ,2
    )AS fraction
FROM cte 
WHERE event_date = nxt-1