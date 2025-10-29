-- Write your PostgreSQL query statement below
SELECT
    DISTINCT c.title
FROM TVProgram t
LEFT JOIN Content c
    USING (content_id)
WHERE EXTRACT (MONTH FROM t.program_date) = 6
AND EXTRACT (YEAR FROM t.program_date) = 2020
AND c.Kids_content = 'Y'
AND c.content_type = 'Movies'