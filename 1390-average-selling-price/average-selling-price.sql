-- Write your PostgreSQL query statement below
WITH cte AS (SELECT 
    p.product_id,
    ROUND(
        SUM(p.price * u.units)::DECIMAL / SUM(u.units)
        ,2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
)

SELECT 
    product_id,
    coalesce(average_price, 0) AS average_price
FROM cte