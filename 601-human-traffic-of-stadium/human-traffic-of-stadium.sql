-- Write your PostgreSQL query statement below
with cte as (
    select 
        id,
        visit_date,
        row_number()over() - id as grp,
        people
    from stadium
    where people >= 100
)
select
    id, 
    visit_date,
    people
from cte 
where grp in (
    select grp
    from cte 
    group by 1
    having(count(*)) >= 3
)
order by 2