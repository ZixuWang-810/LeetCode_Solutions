-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        *,
        LEAD(timestamp) OVER(
            PARTITION BY machine_id, process_id
            ORDER BY timestamp
        ) AS end_time
    FROM Activity
)

SELECT 
    machine_id,
    ROUND(
        AVG((end_time - timestamp)::DECIMAL)
        ,3
    ) AS processing_time
FROM cte
WHERE activity_type = 'start'
GROUP BY machine_id