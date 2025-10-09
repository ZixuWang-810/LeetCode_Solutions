-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        machine_id,
        process_id,
        timestamp,
        LEAD(timestamp) OVER(
            PARTITION BY machine_id, process_id
            ORDER BY process_id, activity_type DESC
        ) AS endtime
    FROM Activity
)
, cte2 AS (
    SELECT
        machine_id,
        process_id,
        (endtime - timestamp) AS time_cost
    FROM cte
    WHERE endtime IS NOT NULL
)
SELECT 
    machine_id,
    ROUND(
        AVG(time_cost)::DECIMAL
        ,3
    ) AS processing_time
FROM cte2
GROUP BY machine_id