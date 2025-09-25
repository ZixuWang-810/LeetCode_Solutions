-- Write your PostgreSQL query statement below
SELECT  machine_id,
        ROUND(
            AVG(
            CASE 
                WHEN activity_type = 'start' THEN -timestamp 
                ELSE timestamp
            END)::decimal * 2 
            , 3) AS processing_time
FROM Activity
GROUP BY machine_id
