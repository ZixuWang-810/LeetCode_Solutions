-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        *,
        COALESCE(
            LEAD(visit_date )OVER(
                PARTITION BY user_id
                ORDER BY visit_date
            )
            , '2021-1-1'
        ) AS nxt
    FROM UserVisits
)
SELECT
    user_id,
    MAX(nxt - visit_date) AS biggest_window
FROM cte
GROUP BY 1
ORDER BY 1