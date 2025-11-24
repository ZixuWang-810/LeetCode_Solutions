-- Write your PostgreSQL query statement below
-- Write your PostgreSQL query statement below
select 
    task_id,
    GENERATE_SERIES(1, subtasks_count, 1) AS subtask_id
from Tasks
except (
    select task_id, subtask_id
    from  Executed
)