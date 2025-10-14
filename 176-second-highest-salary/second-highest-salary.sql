with t1 as (
    select *, dense_rank() over (order by salary desc) as s_rank
    from employee
)
select avg(salary) as SecondHighestSalary
from t1
where s_rank = 2