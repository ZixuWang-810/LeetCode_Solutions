-- Write your PostgreSQL query statement below
SELECT
    e2.employee_id,
    e2.name,
    COUNT(*) AS reports_count,
    AVG(e1.age)::INTEGER AS average_age
FROM Employees e1
JOIN Employees e2
ON e1.reports_to = e2.employee_id
GROUP BY e2.employee_id, e2.name
ORDER BY e2.employee_id