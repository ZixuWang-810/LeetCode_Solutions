-- Write your PostgreSQL query statement below
select distinct on (user_id)
    user_id,
    MAX(time_stamp) last_stamp
from logins
where to_char(time_stamp, 'YYYY') = '2020'
group by 1