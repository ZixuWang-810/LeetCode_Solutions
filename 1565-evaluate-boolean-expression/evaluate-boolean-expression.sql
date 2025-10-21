-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        e.left_operand,
        e.operator,
        e.right_operand,
        v1.value AS left_v,
        v2.value AS right_v
    FROM Expressions e
    INNER JOIN Variables v1
        ON v1.name = e.left_operand
    INNER JOIN Variables v2
        ON v2.name = e.right_operand
)
SELECT
    left_operand,
    operator,
    right_operand,
    CASE 
        WHEN operator = '>' AND left_v > right_v
        OR operator = '<' AND left_v < right_v
        OR operator = '=' AND left_v = right_v
        THEN 'true'
        ELSE 'false'
    END AS value
FROM cte 
