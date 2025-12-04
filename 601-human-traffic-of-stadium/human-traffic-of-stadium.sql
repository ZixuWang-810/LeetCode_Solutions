-- Write your PostgreSQL query statement below
with cte1 as (
    select
        id,
        visit_date,
        people
    from stadium
    where people >= 100
),
cte2 as (
    select
        id,
        visit_date,
        people,
        id - row_number()over(
            order by id
        )as grp
    from cte1
)
select
    id,
    visit_date,
    people
from cte2
where grp in (
    select grp 
    from cte2
    group by 1
    having count(*) > 2
)
order by 2