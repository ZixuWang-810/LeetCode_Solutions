-- Write your PostgreSQL query statement below
with cte as (
    select 
        event_type,
        avg(occurrences)::decimal
    from events
    group by event_type
)
,cte2 as (
    select 
        e.business_id,
        sum(case when e.occurrences > c.avg then 1 else 0 end ) as cnt
    from events e 
    left join cte c
    on c.event_type = e.event_type 
    group by 1
)
select business_id
from cte2
where cnt > 1
