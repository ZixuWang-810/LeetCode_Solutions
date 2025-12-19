-- Write your PostgreSQL query statement below
with cte as (
    select 
        id,
        visit_date,
        people,
        id - row_number()over(
            order by id
        ) as grp
    from stadium
    where people > 99
)
select
    id,
    visit_date,
    people
from cte 
where grp in (
    select grp
    from cte 
    group by grp
    having count(*) > 2
)
order by 2