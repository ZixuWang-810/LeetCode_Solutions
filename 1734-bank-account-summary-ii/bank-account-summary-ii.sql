-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        account,
        SUM(amount) AS amount
    FROM Transactions
    GROUP BY account
)
SELECT 
    u.name AS name,
    c.amount AS balance
FROM Users u
LEFT JOIN cte c
    ON c.account = u.account
WHERE c.amount > 10000