-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
    employee_id
FROM Employee
GROUP BY 1
HAVING COUNT(*) = 1)
-- UNION
(SELECT 
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'
OR employee_id IN (
    SELECT * FROM cte 
)
)