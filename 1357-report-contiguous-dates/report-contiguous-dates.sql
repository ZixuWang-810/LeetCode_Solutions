-- Write your PostgreSQL query statement below
with cte1 as (
    select 
        'failed' as period_state,
        fail_date as d
    from failed
    where to_char(fail_date, 'YYYY') = '2019'
    union all 
    select
        'succeeded',
        success_date
    from succeeded
    where to_char(success_date, 'yyyy') = '2019'
)
,cte as (
    select
        *,
        row_number()over(
            partition by period_state
            order by d
        ) - 
        row_number()over(
            order by d
        ) as r
    from cte1
)
select 
    period_state,
    min(d) as start_date,
    max(d) as end_date
from cte
group by 1, r
order by 2