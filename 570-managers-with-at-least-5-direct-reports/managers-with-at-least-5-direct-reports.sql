-- Write your PostgreSQL query statement below
SELECT a.name
FROM Employee a
JOIN employee b ON a.id = b.managerId
GROUP BY a.name, b.managerId
HAVING COUNT(b.managerId) >= 5