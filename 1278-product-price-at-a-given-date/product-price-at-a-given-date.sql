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
        GROUP BY product_id
    )
)

SELECT 
    DISTINCT p.product_id,
    (CASE WHEN c.new_price IS NOT NULL THEN c.new_price
    ELSE 10 END) AS price
FROM Products p
LEFT JOIN cte c
ON c.product_id = p.product_id
