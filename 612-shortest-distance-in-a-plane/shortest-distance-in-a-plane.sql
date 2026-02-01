-- Write your PostgreSQL query statement below
select
    round(
        min(sqrt(power((p1.x - p2.x), 2) + power((p1.y - p2.y), 2)))::decimal
        ,2
    ) as shortest
from point2d p1
cross join point2d p2
where p1.x != p2.x
or p1.y != p2.y
