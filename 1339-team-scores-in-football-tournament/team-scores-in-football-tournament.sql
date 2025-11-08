-- Write your PostgreSQL query statement below
with cte as (
    select
        host_team,
        guest_team,
        host_goals,
        guest_goals
    from matches
    union all
    select
        guest_team,
        host_team,
        guest_goals,
        host_goals
    from matches
)
select
    t.team_id,
    t.team_name,
    sum(
        case 
            when host_goals > guest_goals then 3
            when host_goals = guest_goals then 1
            else 0
        end
    ) as num_points
from teams t
left join cte c
    on t.team_id = c.host_team
group by 1,2
order by 3 desc, 1