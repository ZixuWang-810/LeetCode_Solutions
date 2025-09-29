-- Write your PostgreSQL query statement below
WITH fuck AS (
    select *, lead(timestamp) over (partition by machine_id, process_id order by timestamp)
    from activity
)

SELECT
    machine_id,
    ROUND(AVG(lead - timestamp) ::DECIMAL , 3) AS processing_time
FROM fuck
WHERE activity_type = 'start'
GROUP BY machine_id
