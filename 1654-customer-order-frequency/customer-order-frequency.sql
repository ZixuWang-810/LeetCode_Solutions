-- Write your PostgreSQL query statement below
with cte1 as (
    select
        o.customer_id
    from orders o 
    left join product p
        using(product_id)
    where to_char(o.order_date, 'YYYY-MM') = '2020-06'
    group by 1
    having sum(o.quantity * p.price) >= 100
),
cte2 as (
    select
        o.customer_id
    from orders o 
    left join product p
        using(product_id)
    where to_char(o.order_date, 'YYYY-MM') = '2020-07'
    group by 1
    having sum(o.quantity * p.price) >= 100
)
select
    customer_id, 
    name
from customers
where customer_id in (
    select customer_id
    from cte1
)
and customer_id in (
    select customer_id
    from cte2
)