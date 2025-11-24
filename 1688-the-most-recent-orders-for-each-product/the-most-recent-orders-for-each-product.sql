-- Write your PostgreSQL query statement below
with cte as (
    select
        order_id,
        order_date,
        product_id,
        rank()over(
            partition by product_id
            order by order_date desc
        ) as rank
    from orders 
)
select
    p.product_name,
    c.product_id,
    c.order_id,
    c.order_date
from cte c
left join products p
    using(product_id)
where rank = 1
order by 1, 2, 3