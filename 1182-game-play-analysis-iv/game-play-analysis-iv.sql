with t1 as (
    select distinct player_id, event_date,
        rank() over (partition by player_id order by event_date) as rank_order,
        lead(event_date) over (partition by player_id order by event_date) as lead
    from activity
)
select round(count(distinct player_id)::decimal / (select count(distinct player_id) from activity)::decimal,2) as fraction
from t1
where rank_order = 1 and lead - event_date = 1