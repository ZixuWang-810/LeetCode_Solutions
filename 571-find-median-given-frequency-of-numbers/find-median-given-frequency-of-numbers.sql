-- Write your PostgreSQL query statement below
with cte as (
    select
        num,
        sum(frequency)over(
            order by num
        ) as upper,
        sum(frequency)over(
            order by num
        ) - frequency as lower
    from numbers
)
select round(avg(num)::decimal, 1) as median
from cte 
where (select sum(frequency)::decimal / 2::decimal from numbers)
between lower and upper
