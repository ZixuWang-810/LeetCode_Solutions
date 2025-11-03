-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        fail_date AS period,
        'failed' AS period_state
    FROM Failed
    WHERE fail_date >= '2019-01-01'
    AND fail_date <= '2019-12-31'
    UNION ALL
    SELECT
        success_date,
        'succeeded'
    FROM Succeeded
    WHERE success_date >= '2019-01-01'
    AND success_date <= '2019-12-31'
)
,cte2 AS (
    SELECT
    *,
     ROW_NUMBER()OVER(
            ORDER BY period
        ) - ROW_NUMBER()OVER(
        PARTITION BY period_state
        ORDER BY period
    ) AS grp
    FROM cte
)
SELECT
    period_state,
    MIN(period) AS start_date,
    MAX(period) AS end_date
FROM cte2
GROUP BY 1, grp
ORDER BY 2
