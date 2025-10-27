-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        host_team,
        guest_team,
        host_goals,
        guest_goals
    FROM Matches
    UNION ALL
    SELECT
        guest_team,
        host_team,
        guest_goals,
        host_goals  
    FROM Matches
)
SELECT
    t.team_id,
    t.team_name,
    SUM(CASE 
        WHEN c.host_goals > c.guest_goals THEN  3
        WHEN c.host_goals = c.guest_goals THEN  1
        ELSE 0
    END) AS num_points
FROM Teams t
LEFT JOIN cte c
    ON c.host_team = t.team_id
GROUP BY 
    1, 2
ORDER BY 
    num_points DESC,
    1