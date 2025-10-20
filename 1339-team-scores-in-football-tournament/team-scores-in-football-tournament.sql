-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        m1.host_team AS team_id,
        m1.host_goals AS h_goals,
        m1.guest_goals AS g_goals
    FROM Teams t
    INNER JOIN Matches m1
        ON m1.host_team = t.team_id
    UNION ALL
    SELECT 
        m2.guest_team,
        m2.guest_goals,
        m2.host_goals
    FROM Teams t
    INNER JOIN Matches m2
        ON m2.guest_team = t.team_id
)
SELECT 
    t.team_id,
    t.team_name,
    SUM(
        CASE 
            WHEN h_goals > g_goals THEN 3
            WHEN h_goals = g_goals THEN 1
            ELSE 0
        END
    ) AS num_points
FROM Teams t
LEFT JOIN cte c
    ON t.team_id = c.team_id
GROUP BY 
    t.team_id,
    t.team_name
ORDER BY 
    num_points DESC,
    t.team_id