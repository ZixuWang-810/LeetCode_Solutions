-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT *
    FROM Calls
    WHERE from_id < to_id
    UNION ALL
    SELECT 
        to_id,
        from_id,
        duration
    FROM Calls
    WHERE from_id > to_id
)
SELECT
    from_id AS person1, 
    to_id AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM cte
GROUP BY 
    from_id,
    to_id
    