-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        product_id,
        year,
        quantity,
        price,
        RANK() OVER(PARTITION BY product_id ORDER BY year) AS year_rank
    FROM Sales
)
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM cte 
WHERE year_rank = 1