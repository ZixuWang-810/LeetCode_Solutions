-- Write your PostgreSQL query statement below
SELECT class
FROM Courses
GROUP BY class
HAVING(
    SELECT COUNT(student) >= 5
)