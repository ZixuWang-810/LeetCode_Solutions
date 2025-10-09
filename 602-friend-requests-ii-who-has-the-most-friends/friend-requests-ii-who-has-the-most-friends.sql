-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT 
        requester_id AS id,
        COUNT(accepter_id) AS num
    FROM RequestAccepted
    GROUP BY requester_id

    UNION ALL

    SELECT
        accepter_id as id,
        COUNT(requester_id) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
)

SELECT
    id,
    SUM(num) AS num
FROM cte
GROUP BY 1
ORDER BY num desc
LIMIT 1