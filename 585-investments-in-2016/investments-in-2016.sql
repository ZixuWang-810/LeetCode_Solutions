-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        pid,
        COUNT(tiv_2015) OVER(PARTITION BY tiv_2015) AS c_5,
        COUNT(*) OVER(PARTITION BY (lat, lon)) AS c_l,
        tiv_2016
    FROM Insurance
)

SELECT
    ROUND(
        SUM(tiv_2016::DECIMAL)
        ,2
    ) AS tiv_2016
FROM cte 
WHERE c_5 > 1
AND c_l = 1
