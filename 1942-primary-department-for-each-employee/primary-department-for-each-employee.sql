-- Write your PostgreSQL query statement below
select 
    employee_id,
    department_id
from Employee
where employee_id in(
    select employee_id
    from employee
    group by 1
    having count(*) = 1
)

union 
select
    employee_id,
    department_id
from Employee
where primary_flag = 'Y'