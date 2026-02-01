select
    round(
        min(sqrt((b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y)))::decimal
        ,2
    ) as shortest 
from point2d a
cross join point2d b
where a.x != b.x or a.y != b.y