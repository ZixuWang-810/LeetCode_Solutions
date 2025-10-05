-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        num,
        LEAD(num) OVER() AS lead,
        LAG(num) OVER() AS lag
    FROM Logs
) 
SELECT
    DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num = lead AND lead = lag