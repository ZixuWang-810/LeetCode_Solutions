with cte as (
    select *, dense_rank() over (order by salary desc) as s_rank
    from employee
)
SELECT (SELECT 
    DISTINCT salary
FROM cte
WHERE s_rank = 2
) AS SecondHighestSalary