-- Write your PostgreSQL query statement below
with cte as (
    select
        p.project_id,
        e.employee_id,
        rank()over(
            partition by p.project_id
            order by e.experience_years desc
        )as rank
    from project p
    left join employee e
        using (employee_id)
)
select 
    project_id,
    employee_id
from cte 
where rank = 1
