-- Write your PostgreSQL query statement below
select
    coalesce(e.employee_id, s.employee_id) employee_id
from employees e
full join salaries s
    using(employee_id)
where e.name is null or s.salary is null