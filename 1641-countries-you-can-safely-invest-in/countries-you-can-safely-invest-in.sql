-- Write your PostgreSQL query statement below
WITH cte1 AS (
    SELECT
        caller_id,
        callee_id,
        duration
    FROM Calls
    UNION ALL
    SELECT
        callee_id,
        caller_id,
        duration
    FROM Calls
)
,cte2 AS (
    SELECT
        p.id,
        c.country_code,
        c.name
    FROM Person p
    LEFT JOIN Country c
        ON SUBSTRING(p.phone_number FROM 1 FOR 3) = c.country_code
)
SELECT
    c2.name AS country
FROM cte1 c1
LEFT JOIN cte2 c2
    ON c1.caller_id = c2.id
GROUP BY 
    c2.country_code,
    1
HAVING 
    AVG(c1.duration) > (SELECT AVG(duration) FROM Calls)