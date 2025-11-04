-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        customer_id,
        product_id,
        TO_CHAR(order_date, 'YYYY-MM') AS month,
        quantity
    FROM Orders
)
, cte2 AS (
    SELECT
        c.customer_id
    FROM cte c
    LEFT JOIN Product p
        USING(product_id)
    WHERE c.month = '2020-06'
    GROUP BY    
        c.customer_id
    HAVING SUM(c.quantity*p.price) >= 100
)
, cte3 AS (
    SELECT
        c.customer_id
    FROM cte c
    LEFT JOIN Product p
        USING(product_id)
    WHERE c.month = '2020-07'
    GROUP BY    
        c.customer_id
    HAVING SUM(c.quantity*p.price) >= 100
)
SELECT
    customer_id,
    name
FROM Customers
WHERE customer_id IN (
    SELECT * FROM cte2
)
AND customer_id IN (
    SELECT * FROM cte3
)