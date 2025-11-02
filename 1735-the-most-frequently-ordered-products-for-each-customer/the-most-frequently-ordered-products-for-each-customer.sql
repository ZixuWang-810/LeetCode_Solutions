with cte as(
    select  customer_id ,product_id, product_name,
    rank()  over(partition by customer_id order by count(*)desc)rnk
    from Customers 
    join Orders 
    using(customer_id)
    join Products 
    using(product_id)
group by 1,2,3
)
select customer_id ,product_id ,product_name 
from cte
where rnk=1