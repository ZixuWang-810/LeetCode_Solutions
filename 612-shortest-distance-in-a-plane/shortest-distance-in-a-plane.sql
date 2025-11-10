-- Write your PostgreSQL query statement below
SELECT ROUND(MIN(SQRT(((b.x - a.x) * (b.x - a.x))+ ((b.y - a.y)*(b.y - a.y))))::numeric,2) as shortest
FROM Point2D a
CROSS JOIN Point2D b
WHERE a.x <> b.x
   OR a.y <> b.y;