-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        *,
        LEAD(num) OVER(ORDER BY id) AS next_num,
        LAG(num) OVER(ORDER BY id) AS pre_num
    FROM Logs
)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM cte
WHERE next_num = pre_num 
AND next_num = num