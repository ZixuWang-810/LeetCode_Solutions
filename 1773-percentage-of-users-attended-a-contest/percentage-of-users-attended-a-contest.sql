-- Write your PostgreSQL query statement below
SELECT  
    contest_id,
    ROUND(
        COUNT(*)::DECIMAL*100 / 
        (SELECT COUNT(*) FROM Users)::DECIMAL
        ,2
    ) AS percentage
FROM Register
GROUP BY 1
ORDER BY 2 DESC, 1