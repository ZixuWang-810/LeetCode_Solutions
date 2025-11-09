-- Write your PostgreSQL query statement below
select
    w.name as warehouse_name,
    sum(w.units * p.width * p.length * p.height)as volume
from warehouse w
left join products p
    using(product_id)
group by 1