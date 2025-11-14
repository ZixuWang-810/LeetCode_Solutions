-- Write your PostgreSQL query statement below
select seller_name
from seller
where seller_id not in (
    select seller_id
    from orders
    where to_char(sale_date, 'YYYY') = '2020'
)
order by 1