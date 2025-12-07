-- Write your PostgreSQL query statement below
select
    name
from candidate
where id = (
    select candidateId
    from vote
    group by 1
    order by count(*) desc
    limit 1
)