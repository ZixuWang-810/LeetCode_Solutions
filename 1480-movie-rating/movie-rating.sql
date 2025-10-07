-- Write your PostgreSQL query statement below
(SELECT
    u.name AS results
FROM Users u
LEFT JOIN MovieRating m
ON u.user_id = m.user_id
GROUP BY m.user_id, u.name
ORDER BY COUNT(*) DESC, u.name
LIMIT 1) 
UNION ALL
(
    SELECT 
        m.title
    FROM Movies m
    LEFT JOIN MovieRating mr
    ON mr.movie_id = m.movie_id
    WHERE created_at >= '2020-02-01' AND 
    created_at < '2020-03-01'
    GROUP BY mr.movie_id, m.title
    ORDER BY AVG(rating::DECIMAL) DESC, m.title
    LIMIT 1
)