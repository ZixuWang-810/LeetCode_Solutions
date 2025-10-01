-- Write your PostgreSQL query statement below
SELECT 
    s.user_id,
    ROUND(
        SUM(
            CASE 
                WHEN c.action = 'confirmed' 
                THEN 1 ELSE 0 
            END)::DECIMAL 
        /COUNT(s.user_id)::DECIMAL
        ,2
    )AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id