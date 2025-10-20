-- Write your PostgreSQL query statement below
SELECT
    e1.employee_id,
    e1.name,
    COUNT(e2.employee_id) AS reports_count,
    AVG(e2.age)::INTEGER AS average_age
FROM Employees e1
LEFT JOIN Employees e2
    ON e1.employee_id = e2.reports_to
WHERE e1.employee_id IN (
    SELECT reports_to
    FROM Employees
)
GROUP BY
    e1.employee_id,
    e1.name
ORDER BY e1.employee_id