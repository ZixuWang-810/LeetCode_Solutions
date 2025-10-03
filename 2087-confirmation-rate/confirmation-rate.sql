-- Write your PostgreSQL query statement below
SELECT 
    s.user_id,
    coalesce(ROUND(
        AVG(
            CASE
                WHEN c.action = 'confirmed' THEN 1
                ELSE 0
            END
        )::DECIMAL
        ,2
    ), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id
