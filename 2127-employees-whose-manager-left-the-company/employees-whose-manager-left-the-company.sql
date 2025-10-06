-- Write your PostgreSQL query statement below
-- SELECT
--     e1.employee_id
-- FROM Employees e1
-- LEFT JOIN Employees e2
-- ON e1.manager_id = e2.employee_id
-- WHERE e2.employee_id IS NULL 
-- AND e1.salary < 30000
-- ORDER BY e1.employee_id

select employee_id
from employees
where salary < 30000
and manager_id is not null
and manager_id not in (select distinct employee_id from employees)
order by 1