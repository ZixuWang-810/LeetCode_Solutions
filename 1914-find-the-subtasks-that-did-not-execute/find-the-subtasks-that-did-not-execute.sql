-- Write your PostgreSQL query statement below
SELECT 
    task_id,
    GENERATE_SERIES(1, subtasks_count, 1) AS subtask_id
FROM Tasks
EXCEPT (
    SELECT *
    FROM Executed
)