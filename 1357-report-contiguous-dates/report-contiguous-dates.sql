-- Write your PostgreSQL query statement below
WITH events AS (
SELECT 
    fail_date AS event_date, 
    'failed' AS event_state
FROM Failed
WHERE fail_date >= '2019-01-01' AND fail_date <= '2019-12-31'
UNION ALL
SELECT 
    success_date , 
    'succeeded'
FROM Succeeded
WHERE success_date >= '2019-01-01' AND success_date <= '2019-12-31'
)
, cte AS (
    SELECT
        *,
        ROW_NUMBER()OVER(
            ORDER BY event_date
        ) - ROW_NUMBER()OVER(
            PARTITION BY event_state
            ORDER BY event_state
        ) AS grp
    FROM events
)
SELECT 
    event_state AS period_state,
    MIN(event_date) AS start_date,
    MAX(event_date) AS end_date
FROM cte
GROUP BY event_state, grp
ORDER BY 2