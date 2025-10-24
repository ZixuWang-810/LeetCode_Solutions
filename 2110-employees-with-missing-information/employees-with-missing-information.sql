-- Write your PostgreSQL query statement below
SELECT
    COALESCE(e.employee_id, s.employee_id) AS employee_id
FROM Employees e
FULL JOIN Salaries s
    ON e.employee_id = s.employee_id
WHERE s.salary IS NULL 
OR e.name IS NULL