-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        machine_id,
        process_id,
        timestamp,
        activity_type ,
        LEAD(timestamp) OVER(PARTITION BY machine_id, process_id ORDER BY timestamp) AS endtime
    FROM Activity
)


SELECT 
    machine_id,
    ROUND(
        AVG(endtime - timestamp)::DECIMAL 
        ,3
    ) AS processing_time 
FROM cte
WHERE activity_type  = 'start'
GROUP BY machine_id
