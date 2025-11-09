-- Write your PostgreSQL query statement below
select
    round(
        sum(
            case
                when order_date = customer_pref_delivery_date
                then 1 else 0
            end
        )::decimal*100 / 
        (select count(*) from Delivery)::decimal
        ,2
    ) as immediate_percentage
from delivery
