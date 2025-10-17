-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        p.product_id,
        p.price, 
        u.units
    FROM Prices p
    LEFT JOIN UnitsSold u 
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date 
    AND p.end_date
)
SELECT
    product_id,
    COALESCE(ROUND(SUM(units * price) ::DECIMAL / SUM(units::DECIMAL), 2), 0) AS average_price 
FROM cte
GROUP BY product_id
