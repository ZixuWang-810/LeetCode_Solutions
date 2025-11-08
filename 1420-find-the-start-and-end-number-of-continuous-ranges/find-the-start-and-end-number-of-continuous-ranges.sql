-- Write your PostgreSQL query statement below
with cte as (
    select
        log_id,
        row_number()over() - log_id as grp
    from logs
)
select
    min(log_id) as start_id,
    max(log_id) as end_id
from cte
group by grp
order by 1