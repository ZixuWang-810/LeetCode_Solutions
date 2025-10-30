-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        employee_id
    FROM Employees
    WHERE manager_id IN (
        SELECT
            employee_id
        FROM Employees
        WHERE manager_id IN (
            SELECT employee_id
            FROM Employees 
            WHERE manager_id IN (
                SELECT employee_id
                FROM Employees
                WHERE manager_id = 1
            )
            OR manager_id = 1
        )
        OR manager_id = 1
    )
)
SELECT employee_id
FROM cte 
WHERE employee_id != 1

