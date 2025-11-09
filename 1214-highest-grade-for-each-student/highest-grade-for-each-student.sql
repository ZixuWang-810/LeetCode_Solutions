-- Write your PostgreSQL query statement below
with cte as (
    select
        student_id,
        course_id,
        grade,
        rank()over(
            partition by student_id
            order by grade desc, course_id
        )
    from enrollments
)
select 
    student_id,
    course_id,
    grade
from cte
where rank = 1
order by student_id