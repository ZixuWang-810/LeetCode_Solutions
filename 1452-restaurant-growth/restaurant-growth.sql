-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
)

SELECT
    visited_on,
    SUM(amount) OVER(
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(
        AVG(amount::DECIMAL) OVER(
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
        ,2
    ) AS average_amount 
FROM cte
ORDER BY 1
OFFSET 6