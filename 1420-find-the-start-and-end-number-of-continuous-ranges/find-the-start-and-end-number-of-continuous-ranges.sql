-- Write your PostgreSQL query statement below
WITH grouped AS (
    SELECT 
        log_id,
        log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS grp
    FROM Logs
)
SELECT 
    MIN(log_id) AS start_id,
    MAX(log_id) AS end_id
FROM grouped
GROUP BY grp
ORDER BY start_id;