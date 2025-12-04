-- Write your PostgreSQL query statement below
select
    query_name,
    round(
        avg(rating::decimal/position::decimal)
        ,2
    ) as quality,
    round(
        sum(case when rating<3 then 1 else 0 end)*100::decimal / 
        count(*)::decimal
        ,2
    ) as poor_query_percentage
from queries
group by 1