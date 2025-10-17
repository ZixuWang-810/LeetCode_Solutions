-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rank
    FROM Employee
)
SELECT
    AVG(salary) AS SecondHighestSalary 
FROM cte 
WHERE rank = 2