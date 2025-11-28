-- Write your PostgreSQL query statement below
select
    extra as report_reason,
    count(distinct post_id) as report_count
from actions 
where action = 'report'
and action_date = '2019-07-04'
and extra is not null
group by extra