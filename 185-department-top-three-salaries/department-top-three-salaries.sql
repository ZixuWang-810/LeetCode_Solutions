-- Write your PostgreSQL query statement below
SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    e.salary AS Salary
FROM Employee e
LEFT JOIN Department d
    ON d.id = e.departmentId
WHERE e.salary IN (
    SELECT DISTINCT salary
    FROM Employee
    WHERE Employee.departmentId = d.id 
    ORDER BY salary DESC
    LIMIT 3
)