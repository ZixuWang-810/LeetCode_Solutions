-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        client_id,
        driver_id,
        status,
        request_at
    FROM Trips
    WHERE client_id IN (
        SELECT users_id
        FROM Users
        WHERE banned = 'No'
        AND role = 'client'
    )
    AND driver_id IN (
        SELECT users_id
        FROM Users
        WHERE banned = 'No'
        AND role = 'driver'
    )
    AND request_at >= '2013-10-01'
    AND request_at <= '2013-10-03'
)
SELECT
    request_at AS Day,
    ROUND(
        SUM(CASE WHEN status = 'completed' THEN 0 ELSE 1 END)::DECIMAL / 
        COUNT(*)::DECIMAL
        ,2
    ) AS "Cancellation Rate"
FROM cte
GROUP BY 1
