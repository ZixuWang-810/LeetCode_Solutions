-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        COUNT(user_id) AS num_u
    FROM Users
)
SELECT
    r.contest_id,
    ROUND(
        COUNT(r.user_id) * 100::DECIMAL / ( SELECT num_u FROM cte)
        ,2
    ) AS percentage
FROM Register r
LEFT JOIN Users u
    ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY
    percentage DESC,
    r.contest_id