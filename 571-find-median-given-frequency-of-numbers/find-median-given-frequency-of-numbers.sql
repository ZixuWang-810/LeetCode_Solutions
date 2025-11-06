-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        num,
        SUM(frequency)OVER(ORDER BY num) - frequency AS lower_b,
        SUM(frequency)OVER(ORDER BY num) AS upper_b
    FROM Numbers
)
,cte2 AS (
    SELECT
        SUM(frequency)::DECIMAL/2 AS median
    FROM Numbers
)
SELECT
    ROUND(
        AVG(num)
        ,1
    ) AS median
FROM cte
WHERE (
    SELECT median FROM cte2
) BETWEEN lower_b AND upper_b