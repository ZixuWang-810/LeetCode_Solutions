-- Write your PostgreSQL query statement below
WITH cte1 AS (
    SELECT
        l1.num AS num1,
        l2.num AS num2,
        l1.id AS id
    FROM Logs l1
    LEFT JOIN Logs l2
    ON l1.id = l2.id-1
)
SELECT DISTINCT
    num AS ConsecutiveNums 
FROM Logs l3
LEFT JOIN cte1 
ON cte1.id = l3.id-2
WHERE cte1.num1 = cte1.num2 AND cte1.num2 = l3.num
