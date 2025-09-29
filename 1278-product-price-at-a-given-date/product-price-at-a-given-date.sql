-- Write your PostgreSQL query statement below
with t1 as (
select *, rank() over (partition by product_id order by change_date desc) price_order
from products
where change_date <= '2019-08-16'
)
select t2.product_id, case when t1.new_price is null then 10 else t1.new_price end as price
from (select distinct product_id from products) t2
left join t1 on t2.product_id = t1.product_id
where price_order = 1 or price_order is null