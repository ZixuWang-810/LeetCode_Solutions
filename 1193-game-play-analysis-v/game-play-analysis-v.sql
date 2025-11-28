-- Write your PostgreSQL query statement below
with cte as (
    select
        player_id,
        event_date,
        rank()over(
            partition by player_id
            order by event_date
        )as rank,
        lead(event_date)over(
            partition by player_id
            order by event_date
        ) as nxt
    from activity
)
select
    event_date install_dt,
    count(distinct player_id) as installs,
    round(
        sum(case when nxt = event_date + 1 then 1 else 0 end)::decimal / 
        count(distinct player_id)::decimal
        ,2
    ) Day1_retention
from cte 
where rank = 1 
group by 1