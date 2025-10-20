-- Write your PostgreSQL query statement below
SELECT
ROUND(
    COUNT (*) FILTER( 
        WHERE customer_pref_delivery_date = order_date
    )*100::DECIMAL / 
    (SELECT COUNT(*) FROM Delivery)::DECIMAL
    ,2
) AS immediate_percentage
FROM Delivery
