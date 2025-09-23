-- Write your PostgreSQL query statement below
with cte as ( 
select product_id, new_price from Products 
where  (product_id, change_date) in (  
    select product_id, max(change_date) as latest_date
    from Products
    where change_date <= '2019-08-16'
    group by 1 )
)

select distinct 
    p.product_id, 
    (CASE WHEN cte.new_price IS NULL THEN 10
    ELSE cte.new_price END) AS price
from Products p
left join cte
on p.product_id = cte.product_id