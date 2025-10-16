-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT *
    FROM Orders 
    WHERE TO_CHAR(sale_date, 'YYYY') = '2020'
)
SELECT 
    s.seller_name
FROM Seller s
LEFT JOIN cte c
    ON c.seller_id = s.seller_id
WHERE c.order_id IS NULL
ORDER BY s.seller_name
