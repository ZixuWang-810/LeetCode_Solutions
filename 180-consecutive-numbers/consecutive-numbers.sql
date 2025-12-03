-- Write your PostgreSQL query statement below
with cte as (
    select
        num,
        lead(num) over() as nxt,
        lag(num)over() as prev
    from logs    
)
select
    distinct num ConsecutiveNums
from cte
where nxt = num 
and nxt = prev