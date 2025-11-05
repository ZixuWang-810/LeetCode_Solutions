-- Write your PostgreSQL query statement below
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Orders o
LEFT JOIN Products p
    USING(product_id)
WHERE TO_CHAR(o.order_date, 'YYYY-MM') = '2020-02'
GROUP BY 1 
HAVING SUM(o.unit) >= 100
