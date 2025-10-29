-- Write your PostgreSQL query statement below
WITH june AS (
    SELECT
        o.customer_id,
        o.product_id,
        o.quantity,
        p.price
    FROM Orders o
    LEFT JOIN Product p
        USING (product_id)
    WHERE order_date >= '2020-06-01'
    AND order_date < '2020-07-01'
)
, july AS (
    SELECT 
        o.customer_id,
        o.product_id,
        o.quantity,
        p.price
    FROM Orders o
    LEFT JOIN Product p
        USING (product_id)
    WHERE order_date >= '2020-07-01'
    AND order_date < '2020-08-01'
)
SELECT
    customer_id,
    name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM june
    GROUP BY customer_id
    HAVING SUM(price * quantity) >= 100
)
AND customer_id IN(
    SELECT customer_id
    FROM july
    GROUP BY customer_id
    HAVING SUM(price * quantity) >= 100
)