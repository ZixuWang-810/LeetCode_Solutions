-- Write your PostgreSQL query statement below
WITH recursive cte AS (
    SELECT employee_id
    FROM Employees 
    WHERE manager_id = 1 AND employee_id != 1
    UNION
    SELECT
        e.employee_id
    FROM Employees e
    JOIN cte c
        ON e.manager_id = c.employee_id
)
SELECT * FROM cte