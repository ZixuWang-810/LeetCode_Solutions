-- Write your PostgreSQL query statement below
SELECT
    query_name,
    ROUND(
        AVG(rating::DECIMAL / position::DECIMAL)
        ,2
    ) AS quality,
    ROUND(
        COUNT(*) FILTER (WHERE rating < 3)*100::DECIMAL / 
        COUNT(*)
        ,2
    ) AS poor_query_percentage
FROM Queries
GROUP BY 
    1