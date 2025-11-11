-- Write your PostgreSQL query statement below
select
    u.name,
    sum(t.amount) as balance
from transactions t
left join users u
    using(account)
group by 1
having sum(amount) > 10000