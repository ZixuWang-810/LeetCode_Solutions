-- Write your PostgreSQL query statement below
SELECT DISTINCT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    GROUP BY c.name, o.sales_id
    HAVING c.name = 'RED'
)