-- Write your PostgreSQL query statement below
select 
    d.dept_name,
    coalesce(count(s.student_id), 0) as student_number
from department d
left join student s
    using(dept_id)
group by 1
order by 2 desc, 1