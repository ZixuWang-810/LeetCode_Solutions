-- Write your PostgreSQL query statement below
SELECT 
    COALESCE(t1.employee_id, t2.employee_id) AS employee_id
FROM Employees t1 
FULL JOIN Salaries t2
    USING (employee_id)
WHERE t1.name IS NULL 
OR t2.salary IS NULL
ORDER BY 1 