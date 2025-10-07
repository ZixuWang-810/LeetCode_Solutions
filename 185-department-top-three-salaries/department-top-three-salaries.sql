-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rank
    FROM Employee
)
SELECT
    d.name AS Department ,
    c.name AS Employee ,
    c.salary AS Salary
FROM cte c 
LEFT JOIN Department d
ON c.departmentId = d.id
WHERE rank < 4