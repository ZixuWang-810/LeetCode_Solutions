-- Write your PostgreSQL query statement below
SELECT
    query_name,
    ROUND(AVG(rating::DECIMAL/position::DECIMAL), 2) AS quality ,
    ROUND(
        COUNT(CASE WHEN rating < 3 THEN 1 END)::DECIMAL / COUNT(*)::DECIMAL
    , 4) * 100 AS poor_query_percentage 
FROM Queries
GROUP BY query_name
