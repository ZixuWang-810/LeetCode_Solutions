-- Write your PostgreSQL query statement below
SELECT  
    DISTINCT s.name
FROM SalesPerson s
LEFT JOIN Orders o
    USING(sales_id)
WHERE s.sales_id NOT IN (
    SELECT
        sales_id
    FROM Orders o
    LEFT JOIN Company c
        USING(com_id)
    WHERE c.name = 'RED'
)