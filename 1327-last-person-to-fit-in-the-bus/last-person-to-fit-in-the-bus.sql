-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        person_name,
        turn,
        SUM(weight) OVER(ORDER BY turn) AS sum_wei
    FROM Queue
)

SELECT
    person_name
FROM cte
WHERE sum_wei <= 1000
ORDER BY turn DESC
LIMIT 1