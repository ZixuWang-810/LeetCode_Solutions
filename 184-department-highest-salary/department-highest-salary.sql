-- Write your PostgreSQL query statement below
SELECT 
    d.name AS Department,
    e.name AS Employee, 
    e.salary AS Salary
FROM Employee e
LEFT JOIN Department d
ON e.departmentId = d.id
GROUP BY e.name, e.salary, d.name
HAVING (d.name, e.salary) IN (
    SELECT d.name, MAX(salary)
    FROM Employee e
    LEFT JOIN Department d
    ON e.departmentId = d.id
    GROUP BY d.name, e.departmentId
)
