-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        TO_CHAR(trans_date,'YYYY-MM') AS month,
        id,
        country,
        state,
        amount
    FROM Transactions
)
SELECT
    month,
    country,
    COUNT(id) AS trans_count,
    COUNT((CASE
            WHEN state = 'approved' THEN 1 
        END)
    ) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE
            WHEN state = 'approved' THEN amount
            ELSE 0
        END
    ) AS approved_total_amount
FROM cte
GROUP BY   
    month,
    country