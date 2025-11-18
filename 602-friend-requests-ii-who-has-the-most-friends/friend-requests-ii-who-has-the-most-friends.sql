-- Write your PostgreSQL query statement below
with cte as (
    select
        requester_id as id,
        accepter_id
    from RequestAccepted
    union all
    select
        accepter_id,
        requester_id
    from RequestAccepted
)
select
    id,
    count(*) as num
from cte
group by 1
order by 2 desc
limit 1
