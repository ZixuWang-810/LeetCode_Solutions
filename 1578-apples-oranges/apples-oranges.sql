-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        sale_date,
        fruit,
        sold_num,
        LEAD(sold_num) OVER(PARTITION BY sale_date ORDER BY sale_date, fruit) AS o_num
    FROM Sales
)
SELECT 
    sale_date,
    (sold_num - o_num) AS diff
FROM cte
WHERE fruit = 'apples'
