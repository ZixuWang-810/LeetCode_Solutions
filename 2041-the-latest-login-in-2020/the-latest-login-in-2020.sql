-- Write your PostgreSQL query statement below
select 
    user_id,
    MAX(time_stamp) last_stamp
from logins
where to_char(time_stamp, 'YYYY') = '2020'
group by 1
order by 1