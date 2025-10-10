-- Write your PostgreSQL query statement below
SELECT
    s.user_id,
    COALESCE(
        ROUND(
            COUNT(CASE WHEN c.action = 'confirmed' THEN 1. END) / COUNT(*)::DECIMAL, 
            2
        )
    ,0.00)AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id
