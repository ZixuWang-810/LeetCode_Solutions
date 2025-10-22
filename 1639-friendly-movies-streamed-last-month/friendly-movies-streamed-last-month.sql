-- Write your PostgreSQL query statement below
SELECT
    DISTINCT c.title
FROM TVProgram t
LEFT JOIN Content c
    ON t.content_id = c.content_id
WHERE TO_CHAR(t.program_date, 'YYYY-MM') = '2020-06'
AND c.Kids_content = 'Y'
AND c.content_type = 'Movies'