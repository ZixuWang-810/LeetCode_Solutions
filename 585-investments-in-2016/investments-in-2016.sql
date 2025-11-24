-- Write your PostgreSQL query statement below
select
    round(sum(tiv_2016)::decimal,2 ) as tiv_2016
from insurance
where tiv_2015 in (
    select
        tiv_2015
    from insurance
    group by 1
    having(count(*)) > 1
)
and (lat, lon) in (
    select lat, lon
    from insurance
    group by 1,2
    having count(*) = 1
)
