-- Write your PostgreSQL query statement below
SELECT 
    query_name,
    ROUND(
        AVG(rating::DECIMAL/position::DECIMAL)
        ,2
    ) AS quality,
    ROUND(
        COUNT(CASE WHEN rating < 3 THEN 1 END)*100::DECIMAL / COUNT(*)::DECIMAL
        ,2
    ) AS poor_query_percentage
FROM Queries
GROUP BY 1
