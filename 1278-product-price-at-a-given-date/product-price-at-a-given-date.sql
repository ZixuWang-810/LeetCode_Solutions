-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        product_id,
        new_price,
        RANK() OVER(
                PARTITION BY product_id ORDER BY change_date DESC
            ) AS rank
    FROM Products
    WHERE change_date <= '2019-08-16'
)

SELECT 
    DISTINCT p.product_id,
    COALESCE(c.new_price, 10) AS price
FROM Products p
LEFT JOIN cte c
ON p.product_id = c.product_id
WHERE rank = 1 OR rank IS NULL