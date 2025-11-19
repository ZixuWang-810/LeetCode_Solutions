-- Write your PostgreSQL query statement below
with cte as (
    select
        num,
        frequency,
        sum(frequency)over(
            order by num
        ) as upper_b,
        sum(frequency)over(
            order by num
        ) - frequency as lower_b
    from numbers
)
select round(avg(num)::decimal,1) as median
from cte 
where (
    select sum(frequency)::decimal / 2
    from numbers
)
between lower_b and upper_b