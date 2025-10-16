-- Write your PostgreSQL query statement below
SELECT 
    name,
    COALESCE(sum, 0) AS travelled_distance
FROM (
        SELECT
            u.name,
            SUM(distance) AS sum
        FROM Users u
        LEFT JOIN Rides r
            ON u.id = r.user_id
        GROUP BY 
            u.name,
            u.id
    )
ORDER BY 
    travelled_distance DESC,
    name
