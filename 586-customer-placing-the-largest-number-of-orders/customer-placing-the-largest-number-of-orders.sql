-- Write your PostgreSQL query statement below
SELECT
    DISTINCT customer_number
FROM Orders
WHERE customer_number = (
    SELECT customer_number
    FROM Orders
    GROUP BY customer_number
    ORDER BY COUNT(order_number) DESC
    LIMIT 1
)