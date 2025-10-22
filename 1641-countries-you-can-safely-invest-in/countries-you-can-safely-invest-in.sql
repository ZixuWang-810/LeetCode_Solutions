-- Write your PostgreSQL query statement below
WITH cte1 AS (
    SELECT
        p.id,
        c.name,
        c.country_code
    FROM Person p
    LEFT JOIN Country c
        ON c.country_code = SUBSTRING(p.phone_number FROM 1 FOR 3)
)
,cte2 AS (
    SELECT
        caller_id AS id,
        duration
    FROM Calls
    UNION ALL
    SELECT 
        callee_id,
        duration
    FROM Calls
)


SELECT
    c1.name AS country
FROM cte2 c2
LEFT JOIN cte1 c1 
    ON c1.id = c2.id
GROUP BY 1, c1.country_code
HAVING AVG(duration)::DECIMAL > (
    SELECT AVG(duration)::DECIMAL
    FROM Calls
)