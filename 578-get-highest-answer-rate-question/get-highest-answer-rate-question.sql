-- Write your PostgreSQL query statement below
SELECT
    DISTINCT question_id AS survey_log
FROM SurveyLog
WHERE question_id = (
    SELECT question_id
    FROM SurveyLog
    GROUP BY 1
    ORDER BY (
        SUM(CASE WHEN action = 'answer' THEN 1 ELSE 0 END)::DECIMAL / 
        COUNT(*)::DECIMAL
    )DESC, 1
    LIMIT 1
)