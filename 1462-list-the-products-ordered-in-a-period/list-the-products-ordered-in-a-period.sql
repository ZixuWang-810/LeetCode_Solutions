-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        product_id,
        SUM(unit) AS amount
    FROM orders
    WHERE order_date >= '2020-02-01'
    AND order_date < '2020-03-01'
    GROUP BY product_id
)

SELECT
    p.product_name,
    c.amount AS unit
FROM cte c
LEFT JOIN Products p
ON c.product_id = p.product_id
WHERE amount >= 100