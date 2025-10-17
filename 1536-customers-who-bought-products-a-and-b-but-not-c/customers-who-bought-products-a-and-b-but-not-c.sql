-- Write your PostgreSQL query statement below
WITH cte1 AS (
    SELECT
        customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(*) FILTER (WHERE product_name = 'A') > 0
)
, cte2 AS (
    SELECT
        customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(*) FILTER (WHERE product_name = 'B') > 0
)
,cte3 AS (
    SELECT
        customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(*) FILTER (WHERE product_name = 'C') = 0
)

SELECT *
FROM Customers
WHERE customer_id IN ( SELECT * FROM cte1)
AND customer_id IN ( SELECT * FROM cte2)
AND customer_id IN ( SELECT * FROM cte3)
ORDER BY customer_id