-- Write your PostgreSQL query statement below
SELECT
    p.product_id,
    p.product_name
FROM Product p
LEFT JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING MAX(sale_date) <= '2019-03-31'
AND MIN(sale_date) >= '2019-01-01'