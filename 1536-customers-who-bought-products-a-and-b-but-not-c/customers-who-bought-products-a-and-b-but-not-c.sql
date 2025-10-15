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
HAVING SUM((o.product_name = 'A')::INTEGER) > 0 
AND SUM((o.product_name = 'B')::INTEGER) > 0
AND SUM((o.product_name = 'C')::INTEGER) = 0
ORDER BY c.customer_id