# Write your MySQL query statement below
with cte1 as (
    select
        'failed' as period_state,
        fail_date as state_date
    from Failed
    WHERE fail_date >= '2019-01-01' AND fail_date <= '2019-12-31'
    union all
    select
        'succeeded',
        success_date
    from succeeded
    WHERE success_date >= '2019-01-01' AND success_date <= '2019-12-31'
)
,cte as (
    select
        *,
        row_number()over(
            order by state_date
        ) - row_number() over(
            partition by period_state
            order by state_date
        )as grp
    from cte1
)
select 
    period_state,
    min(state_date) start_date,
    max(state_date) end_date
from cte
group by 1, grp
order by 2