-- Write your PostgreSQL query statement below
SELECT 
    name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM Orders o
    LEFT JOIN Company c
    ON c.com_id = o.com_id
    WHERE c.name = 'RED'
)