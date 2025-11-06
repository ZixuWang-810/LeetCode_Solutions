-- Write your PostgreSQL query statement below
SELECT
    id,
    month,
    SUM(salary)OVER(
        PARTITION BY id
        ORDER BY month
        RANGE BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS salary
FROM Employee
WHERE (id, month) NOT IN (
    SELECT
        id,
        MAX(month)
    FROM Employee
    GROUP BY 1
)
ORDER BY 1, 2 DESC