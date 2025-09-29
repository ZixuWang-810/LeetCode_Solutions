-- Write your PostgreSQL query statement below

WITH cte AS (
    SELECT 
        s1.user_id,
        c.time_stamp,
        c.action
FROM (
    SELECT
        DISTINCT user_id
        FROM Signups s
) s1

LEFT JOIN Confirmations c
ON s1.user_id = c.user_id
)

SELECT
    user_id,
    ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1.00 
    ELSE 0 END), 2) AS confirmation_rate
FROM cte
GROUP BY 
    user_id