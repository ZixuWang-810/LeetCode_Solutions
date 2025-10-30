with recursive subordinates as (
    select employee_id 
    from employees 
    where manager_id = 1 and employee_id <> 1
    union
    select employees.employee_id
    from employees
    join subordinates 
        on employees.manager_id = subordinates.employee_id
)

select * from subordinates