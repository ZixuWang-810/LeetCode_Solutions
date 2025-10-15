-- Write your PostgreSQL query statement below
SELECT
    c.customer_id,
    c.customer_name
FROM Orders o
LEFT JOIN Customers c
ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name
HAVING COUNT(CASE WHEN o.product_name = 'A' THEN 1 END) > 0 
AND COUNT(CASE WHEN o.product_name = 'B' THEN 1 END) > 0
AND COUNT(CASE WHEN o.product_name = 'C'THEN 1 END) = 0
ORDER BY c.customer_id