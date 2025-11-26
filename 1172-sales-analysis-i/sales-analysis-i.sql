-- Write your PostgreSQL query statement below
with cte as (
    select
        seller_id,
        rank()over(
            order by sum(price) desc
        )as rank
    from sales
    group by 1
)
select
    seller_id
from cte
where rank = 1

