-- Write your PostgreSQL query statement below
WITH cte1 AS  (
    SELECT
        u.name,
        COUNT(*) AS num
    FROM Users u
    LEFT JOIN MovieRating m
    ON u.user_id = m.user_id
    GROUP BY u.name
    ORDER BY u.name

)
, cte2 AS (
    SELECT
        m.title,
        AVG(mr.rating) as avg
    FROM MovieRating mr
    LEFT JOIN Movies m
    ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= '2020-02-01'
    AND mr.created_at < '2020-03-01'
    GROUP BY m.title
    ORDER BY m.title
)

(
    SELECT name AS results
    FROM cte1
    WHERE num = (SELECT MAX(num) FROM cte1)
    LIMIT 1
)
UNION ALL
(
    SELECT title
    FROM cte2
    WHERE avg = (SELECT MAX(avg) FROM cte2)
    LIMIT 1
)