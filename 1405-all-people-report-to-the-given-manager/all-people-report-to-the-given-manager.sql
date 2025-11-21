-- Write your PostgreSQL query statement below
with recursive cte as (
    select employee_id
    from employees
    where employee_id != 1 and manager_id = 1
    union all
    select e.employee_id
    from employees e
    join cte c
    on c.employee_id = e.manager_id
)
select *
from cte