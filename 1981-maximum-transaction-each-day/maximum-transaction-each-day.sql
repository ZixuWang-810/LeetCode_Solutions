-- Write your PostgreSQL query statement below
with cte1 as (
    select
        transaction_id,
        to_char(day, 'YYYY-MM-DD') as day,
        amount
    from transactions
)
,cte2 as (
    select
        transaction_id,
        rank()over(
            partition by day
            order by amount desc
        ) rk
    from cte1
)
select transaction_id
from cte2
where rk = 1
order by 1