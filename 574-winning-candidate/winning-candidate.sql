-- Write your PostgreSQL query statement below
SELECT
    name
FROM Candidate
WHERE id = (
    SELECT
        candidateId
    FROM Vote
    GROUP BY candidateId
    ORDER BY COUNT(candidateId) DESC
    LIMIT 1
)