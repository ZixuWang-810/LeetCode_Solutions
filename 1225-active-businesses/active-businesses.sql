-- Write your PostgreSQL query statement below
with cte1 as (
    select 
        event_type,
        round(avg(occurrences)::decimal,1) average
    from events
    group by 1
)
, cte2 as (
    select
        business_id,
        case when e.occurrences > c.average then 1 else 0 end as count
    from events e
    left join cte1 c
        using (event_type)
)
select business_id
from cte2 
group by 1
having sum(count) > 1