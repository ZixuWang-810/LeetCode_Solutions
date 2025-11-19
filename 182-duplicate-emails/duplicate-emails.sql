-- Write your PostgreSQL query statement below
select distinct email
from person
group by 1
having count(*) > 1