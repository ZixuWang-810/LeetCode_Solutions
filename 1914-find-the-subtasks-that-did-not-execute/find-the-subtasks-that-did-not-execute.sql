-- Write your PostgreSQL query statement below
-- Write your PostgreSQL query statement below
select 
    task_id,
    generate_series(1, subtasks_count, 1) as subtask_id
from tasks
except (
    select task_id, subtask_id
    from  executed
)