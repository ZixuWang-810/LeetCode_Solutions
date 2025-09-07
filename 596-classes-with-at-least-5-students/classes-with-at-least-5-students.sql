-- Write your PostgreSQL query statement below
SELECT DISTINCT class
FROM Courses
WHERE class IN (
    SELECT class
    FROM courses
    GROUP BY class
    HAVING COUNT(student) >= 5
)