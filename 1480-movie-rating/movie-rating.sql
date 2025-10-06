-- Write your PostgreSQL query statement below
(
    SELECT 
        u.name AS results
    FROM MovieRating m
    LEFT JOIN Users u
    ON m.user_id = u.user_id
    GROUP BY m.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name
    LIMIT 1
)

UNION ALL

(
    WITH cte AS (
        SELECT 
            movie_id,
            rating,
            TO_CHAR(created_at, 'YYYY-MM') AS month
        FROM MovieRating
    )
    SELECT 
        m.title
    FROM cte c
    LEFT JOIN Movies m
    ON c.movie_id = m.movie_id
    WHERE c.month >= '2020-02' AND c.month < '2020-03'
    GROUP BY c.movie_id, m.title
    ORDER BY AVG(rating) DESC, m.title
    LIMIT 1
)