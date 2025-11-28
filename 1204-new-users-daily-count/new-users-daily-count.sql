-- Write your PostgreSQL query statement below
with cte as (
    select
        user_id,
        min(activity_date) as first
    from traffic
    where activity = 'login'
    group by user_id
)
select
    activity_date as login_date,
    count(distinct user_id) as user_count
from traffic
where (user_id, activity_date) in (
    select
        user_id,
        first
    from cte
)
and activity_date between '2019-06-30'::date-90 
and '2019-06-30'
and activity = 'login'
group by 1