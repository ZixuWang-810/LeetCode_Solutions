-- Write your PostgreSQL query statement below
WITH cte1 AS (
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY company
            ORDER BY salary, id
        ) AS rn
    FROM Employee
)
,cte2 AS (
    SELECT 
        company,
        CASE 
            WHEN MAX(rn) % 2 = 1 THEN MAX(rn) / 2 + 1 
            WHEN MAX(rn) % 2 = 0 THEN MAX(rn) / 2 + 1
            ELSE 0 
        END AS rn1,
        CASE WHEN MAX(rn) % 2 = 0 THEN MAX(rn) / 2
        ELSE 0 END AS rn2
    FROM cte1
    GROUP BY 1
)
SELECT
    id,
    company,
    salary
FROM cte1 
WHERE (company, rn)  IN (
    SELECT
        company,
        rn1
    FROM cte2
)
OR (company, rn)  IN(
    SELECT company, rn2 FROM cte2
)