-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        *,
        RANK() OVER(
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS rank
    FROM Orders
)
SELECT
    cu.name AS customer_name,
    c.customer_id,
    c.order_id,
    c.order_date
FROM cte c
LEFT JOIN Customers cu
    USING (customer_id)
WHERE rank < 4
ORDER BY 1,2,4 DESC