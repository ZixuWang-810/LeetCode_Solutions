-- Write your PostgreSQL query statement below
with cte as (
    select
        exam_id,
        student_id,
        rank()over(
            partition by exam_id
            order by score desc
        ) high,
        rank() over(
            partition by exam_id
            order by score 
        ) low
    from exam
)
select
    distinct c.student_id,
    s.student_name
from cte c
left join student s
    using (student_id)
where c.student_id not in (
    select
        student_id
    from cte 
    where low = 1
    or high = 1
)
order by 1