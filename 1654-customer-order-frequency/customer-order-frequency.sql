-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        *,
        TO_CHAR(order_date, 'YYYY-MM') AS ym
    FROM Orders
)
,cte2 AS (
    SELECT
        c.customer_id,
        c.ym,
        SUM(c.quantity * p.price) AS amount
    FROM cte c
    LEFT JOIN Product p
        ON p.product_id = c.product_id
    WHERE c.ym = '2020-06' OR c.ym = '2020-07'
    GROUP BY c.customer_id, c.ym
)
, result AS (
    SELECT
        customer_id,
        amount,
        LEAD(amount) OVER(PARTITION BY customer_id) AS am
    FROM cte2

)

SELECT
    cu.customer_id,
    cu.name
FROM Customers cu
LEFT JOIN result r
    ON r.customer_id = cu.customer_id
WHERE amount >= 100 AND am >= 100