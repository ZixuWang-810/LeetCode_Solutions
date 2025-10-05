-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        product_id,
        new_price
    FROM Products 
    WHERE (product_id, change_date) IN (
        SELECT 
            product_id,
            MAX(change_date)
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY 1
    )
)

SELECT
    DISTINCT p.product_id,
    coalesce(c.new_price, 10) AS price
FROM Products p
LEFT JOIN cte c
ON p.product_id = c.product_id