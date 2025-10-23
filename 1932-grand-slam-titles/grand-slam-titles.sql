-- Write your PostgreSQL query statement below
WITH cte1 AS (
    SELECT Wimbledon AS game
    FROM Championships
    UNION ALL
    SELECT Fr_open
    FROM Championships
    UNION ALL
    SELECT US_open
    FROM Championships
    UNION ALL
    SELECT Au_open
    FROM Championships
)

SELECT
    game AS player_id,
    p.player_name,
    COUNT(*) AS grand_slams_count
FROM cte1 c
LEFT JOIN Players p
    ON c.game = p.player_id
GROUP BY 1,2
