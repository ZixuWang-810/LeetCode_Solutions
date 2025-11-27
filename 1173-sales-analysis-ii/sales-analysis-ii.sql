-- Write your PostgreSQL query statement below
select distinct buyer_id
from sales 
where buyer_id not in (
    select s.buyer_id
    from sales s
    left join product p
        using(product_id)
    where p.product_name = 'iPhone'
)
and buyer_id in (
    select s.buyer_id
    from sales s
    left join product p
        using(product_id)
    where p.product_name = 'S8'
)