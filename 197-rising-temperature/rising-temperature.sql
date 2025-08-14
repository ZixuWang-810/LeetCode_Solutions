# Write your MySQL query statement below
SELECT w2.id
FROM Weather w
LEFT JOIN Weather w2 
    ON datediff(w2.recordDate, w.recordDate) = 1
WHERE 
    w2.temperature > w.temperature