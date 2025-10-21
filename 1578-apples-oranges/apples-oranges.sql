WITH cte AS (
    SELECT
        sale_date,
        CASE 
            WHEN fruit = 'oranges' THEN -sold_num
            ELSE sold_num
        END
    FROM Sales
)
SELECT 
    sale_date,
    SUM(sold_num) AS diff
FROM cte
GROUP BY 1
ORDER BY 1