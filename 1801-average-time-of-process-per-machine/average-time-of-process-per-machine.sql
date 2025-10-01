-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        machine_id,
        process_id,
        lead(timestamp) OVER(
            PARTITION BY 
                machine_id,
                process_id
            ORDER BY timestamp
        ) AS end_time
    FROM Activity     
)

SELECT
    a.machine_id,
    ROUND(AVG(c.end_time - a.timestamp) ::DECIMAL , 3) AS processing_time
FROM Activity a
LEFT JOIN cte c
    ON a.machine_id = c.machine_id
    AND a.process_id = c.process_id
WHERE a.activity_type = 'start'
GROUP BY a.machine_id