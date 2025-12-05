-- Write your PostgreSQL query statement below
with cte1 as (
    select
        book_id,
        name
    from books 
    where available_from < '2019-05-23'
),
cte2 as (
    select
        book_id,
        sum(quantity) as quantity
    from orders
    where dispatch_date between '2018-06-23' 
    and  '2019-06-23'
    group by 1
)
select 
    b.book_id,
    b.name
from books b
left join cte2 c
    using(book_id)
where coalesce(c.quantity, 0) < 10
and book_id in (
    select book_id from cte1
)
