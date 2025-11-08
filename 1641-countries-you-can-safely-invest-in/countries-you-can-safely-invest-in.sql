-- Write your PostgreSQL query statement below
with cte as (
    select
        id,
        name,
        substring(phone_number from 1 for 3) as cc
    from person
)
, cte2 as (
    select * from calls
    union all
    select
        callee_id,
        caller_id,
        duration
    from calls
)
,cte3 as (
    select
        c.cc
    from cte2 c2
    left join cte c
        on c2.caller_id = c.id
    group by 1
    having avg(duration) > (select avg(duration) from calls)
)
select name as country
from country
where country_code in (
    select cc from cte3
)