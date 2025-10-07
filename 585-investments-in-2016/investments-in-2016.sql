-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        pid,
        tiv_2016,
        COUNT(pid) OVER(PARTITION BY tiv_2015) AS num_tiv,
        COUNT(pid) OVER(PARTITION BY (lat,lon)) AS num_loc
    FROM Insurance
)
SELECT 
    ROUND(SUM(tiv_2016)::DECIMAL, 2) AS tiv_2016 
FROM cte
WHERE num_tiv > 1
AND num_loc = 1