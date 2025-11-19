-- Write your PostgreSQL query statement below
(select
    u.name as results
from users u
left join movierating m
    using (user_id)
group by u.name, u.user_id
order by count(*) desc, 1
limit 1)
union all
(select mo.title
from movies mo
left join movierating m
    using (movie_id)
where m.created_at >= '2020-02-01' 
and m.created_at < '2020-03-01'
group by mo.title
order by avg(m.rating) desc, 1
limit 1
)