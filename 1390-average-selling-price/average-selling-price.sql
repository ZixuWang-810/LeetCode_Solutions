-- Write your PostgreSQL query statement below
select
    p.product_id,
    coalesce(round(
        sum(u.units*p.price)::decimal / 
        sum(u.units)::decimal
        ,2
    ), 0) as average_price
from prices p
left join unitssold u
    on u.product_id = p.product_id
    and u.purchase_date between p.start_date 
    and p.end_date
group by 1
