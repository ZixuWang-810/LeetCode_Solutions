-- Write your PostgreSQL query statement below
with cte as (
    select
        customer_id,
        product_id,
        rank()over(
            partition by customer_id
            order by count(product_id) desc
        ) as rank
    from orders 
    group by 1,2
)
select
    c.customer_id,
    c.product_id,
    p.product_name
from cte c
left join products p
    using(product_id)
where rank = 1
