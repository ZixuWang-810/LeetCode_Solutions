-- Write your PostgreSQL query statement below
with cte as (
    select
        seat_id,
        lag(free)over(
            order by seat_id
        ) prev,
        free,
        lead(free)over(
            order by seat_id
        ) nxt
    from cinema 
)
select
    seat_id
from cte
where prev =1 and free = 1
or free = 1 and nxt = 1
order by 1