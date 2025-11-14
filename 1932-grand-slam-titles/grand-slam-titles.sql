# Write your MySQL query statement below
WITH cte AS (
    SELECT Wimbledon AS player_id
    FROM Championships
    UNION ALL
    SELECT Fr_open
    FROM Championships
    UNION ALL
    SELECT US_open
    FROM Championships
    UNION ALL
    SELECT Au_open
    FROM Championships
)
select
    c.player_id,
    p.player_name,
    count(*) as grand_slams_count 
from cte c
left join players p
    using (player_id)
group by 1,2