-- Write your PostgreSQL query statement below
select
    u.name,
    coalesce(sum(r.distance), 0) travelled_distance
from users u
left join rides r
    on u.id = r.user_id
group by 1, u.id
order by 2 desc, 1