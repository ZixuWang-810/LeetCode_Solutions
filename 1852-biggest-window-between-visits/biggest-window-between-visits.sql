-- Write your PostgreSQL query statement below
with cte as (
    select
        user_id,
        visit_date,
        coalesce(lead(visit_date)over(
            partition by user_id
            order by visit_date
        ), '2021-1-1') as nxt
    from uservisits
)
select
    user_id,
    max(nxt - visit_date) biggest_window
from cte
group by 1
order by 1