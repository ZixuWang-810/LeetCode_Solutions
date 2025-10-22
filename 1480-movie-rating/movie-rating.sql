-- Write your PostgreSQL query statement below
(SELECT
    u.name AS results
FROM MovieRating m
LEFT JOIN Users u
    ON u.user_id = m.user_id
GROUP BY 1
ORDER BY COUNT(*) DESC, 1
LIMIT 1)
UNION ALL
(SELECT
    m.title
FROM MovieRating mr
LEFT JOIN Movies m
    ON m.movie_id = mr.movie_id
WHERE mr.created_at >= '2020-02-01'
AND mr.created_at < '2020-03-01'
GROUP BY 
    1,
    mr.movie_id
ORDER BY AVG(rating) DESC, 1
LIMIT 1)