-- Write your PostgreSQL query statement below
with cte1 as (
    select
        sum(frequency)::decimal/2 as median
    from numbers
)
, cte2 as (
    select
        num,
        sum(frequency)over(order by num) as ub,
        sum(frequency)over(order by num) - frequency as lb
    from numbers
)
select 
    round(avg(num), 1) median
from cte2
where (
    select median
    from cte1
) between lb and ub
