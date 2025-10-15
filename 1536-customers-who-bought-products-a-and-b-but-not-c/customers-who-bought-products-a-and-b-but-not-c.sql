with customers_a as (
    select distinct customer_id
    from orders
    where product_name = 'A'
),
customers_b as (
    select distinct customer_id
    from orders
    where product_name = 'B'
),
customers_c as (
    select distinct customer_id
    from orders
    where product_name = 'C'
)
select
    customer_id,
    customer_name
from customers
where
    customer_id in (select customer_id from customers_a)
    and customer_id in (select customer_id from customers_b)
    and customer_id not in (select customer_id from customers_c)
order by customer_id asc