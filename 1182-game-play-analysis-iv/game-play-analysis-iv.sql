-- Write your PostgreSQL query statement below
with cte as (
    select
        player_id,
        event_date,
        rank()over(
            partition by player_id
            order by event_date
        ) as rank,
        lead(event_date)over(
            partition by player_id
            order by event_date
        ) as nxt
    from activity
)
select
    round(
        count(distinct player_id)::decimal / 
        (select count(distinct player_id)::decimal from activity)
    ,2
    ) as fraction
from cte 
where rank = 1
and nxt = event_date+1
