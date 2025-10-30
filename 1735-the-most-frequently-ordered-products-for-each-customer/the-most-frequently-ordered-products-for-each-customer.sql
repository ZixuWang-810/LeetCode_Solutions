-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        *, 
        COUNT(*) OVER(
            PARTITION BY customer_id, product_id
        ) AS orders
    FROM Orders
)
SELECT
    DISTINCT c.customer_id, 
    c.product_id, p.product_name
FROM cte c
LEFT JOIN Products p
    USING(product_id)
WHERE (c.customer_id, c.orders) IN (
    SELECT
        customer_id,
        MAX(orders)
    FROM cte
    GROUP BY 1
)
