-- Write your PostgreSQL query statement below
WITH CTE AS(
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY company 
            ORDER BY company,salary,id
        ) rm
    FROM 
        Employee
)
, CTE2 AS (
    SELECT 
	    company,
        CASE 
            WHEN MAX(rm) % 2 = 0 THEN MAX(rm)/2 
            WHEN MAX(rm) % 2 = 1 THEN (MAX(rm) - 1)/2 + 1 ELSE 0 
        END rm1, 
        CASE 
            WHEN MAX(rm) % 2 = 0  
            THEN MAX(rm)/2 + 1 
            ELSE 0 
        END rm2
    FROM CTE
    GROUP BY company 
)
,cte3 AS (
    SELECT
        company,
        rm1 AS rm
    FROM CTE2
    UNION ALL
    SELECT
        company,
        rm2 
    FROM CTE2
)

SELECT
	c1.id,
    c1.company,
    c1.salary
FROM CTE c1 
INNER JOIN cte3 c3
    ON c1.company = c3.company AND c1.rm = c3.rm
ORDER BY 1