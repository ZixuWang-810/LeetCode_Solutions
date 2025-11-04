-- Write your PostgreSQL query statement below
WITH RECURSIVE cte AS (
    SELECT
        employee_id
    FROM Employees
    WHERE manager_id = 1
    AND employee_id != 1
    UNION
    SELECT
        e.employee_id
    FROM Employees e
    JOIN cte c 
        ON c.employee_id = e.manager_id
)
SELECT * FROM cte