-- Write your PostgreSQL query statement below
SELECT
    p.product_id,
    COALESCE(ROUND(
        (SUM(u.units*p.price)::DECIMAL )/ (SUM(u.units)::DECIMAL)
        ,2
    ), 0)AS average_price
FROM UnitsSold u
RIGHT JOIN Prices p
ON u.product_id = p.product_id
AND u.purchase_date BETWEEN p.start_date
AND p.end_date
GROUP BY p.product_id