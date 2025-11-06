-- Write your PostgreSQL query statement below
select percentile_cont(0.5) within group (order by num) as median
from (select num
from numbers, generate_series(1, frequency))