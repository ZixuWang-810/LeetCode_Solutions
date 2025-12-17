-- Write your PostgreSQL query statement below
with cte as (
    select
        o.customer_id,
        o.product_id,
        p.product_name,
        rank()over(
            partition by o.customer_id 
            order by count(*) desc
        ) rk
    from orders o
    left join products p
        using (product_id)
    group by 1,2,3
)
select
    customer_id,
    product_id,
    product_name
from cte
where rk = 1
