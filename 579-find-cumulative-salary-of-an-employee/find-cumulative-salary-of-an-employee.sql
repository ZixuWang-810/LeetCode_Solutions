-- Write your PostgreSQL query statement below
with cte as (
    select
        id,
        month,
        salary,
        rank()over(
            partition by id
            order by month desc
        ) rank
    from employee
)
select
    id,
    month,
    sum(salary)over(
        partition by id
        order by month
        range between 2 preceding and current row
    ) salary
from cte 
where rank != 1
order by id, month desc
