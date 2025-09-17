-- Write your PostgreSQL query statement below
SELECT 
    DISTINCT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1