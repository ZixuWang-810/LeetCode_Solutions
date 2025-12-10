-- Write your PostgreSQL query statement below
with cte1 as (
    select
        id,
        company,
        salary,
        row_number()over(
            partition by company
            order by salary
        ) rn
    from employee
),
cte2 as (
    select
        company,
        max(rn) / 2 + 1 as m1,
        case when max(rn) % 2 = 0 then max(rn) / 2 
        else 0 end as m2
    from cte1
    group by 1
)
select
    id, 
    company,
    salary
from cte1
where (company, rn) in (
    select
        company,
        m1
    from cte2
)
or (company, rn) in (
    select
        company,
        m2
    from cte2
)