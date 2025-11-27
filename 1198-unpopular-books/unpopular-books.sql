 -- Write your PostgreSQL query statement below
with cte as
(Select book_id,sum(quantity) as total_sold
from Orders
WHERE dispatch_date >= DATE '2018-06-23' 
  AND dispatch_date < DATE '2019-06-23'
group by book_id)

select b.book_id,b.name
from Books b
left join cte as c
on b.book_id = c.book_id
where COALESCE(total_sold,0) <10 
and available_from < ('2019-05-23')