-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        log_id,
        log_id - ROW_NUMBER()OVER() AS grp
    FROM Logs
)
SELECT
    MIN(log_id) AS start_id,
    MAX(log_id) AS end_id
FROM cte 
GROUP BY grp
ORDER BY 1