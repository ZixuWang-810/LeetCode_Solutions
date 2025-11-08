-- Write your PostgreSQL query statement below
with cte as (
    select
        visited_on,
        sum(amount) as amount
    from customer
    group by 1
)
select
    visited_on,
    sum(amount)over(
        order by visited_on
        rows between 6 preceding and current row
    )as amount,
    round(avg(amount)over(
        order by visited_on
        rows between 6 preceding and current row
    ),2) as average_amount
from cte
order by 1
offset 6