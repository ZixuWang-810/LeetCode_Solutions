-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        *,
        RANK() OVER(
            PARTITION BY product_id
            ORDER BY order_date DESC
        ) rank
    FROM Orders 
)
SELECT
    p.product_name,
    p.product_id,
    c.order_id,
    c.order_date
FROM cte c
LEFT JOIN Products p
    USING(product_id)
WHERE rank = 1
ORDER BY 1,2,3