-- Write your PostgreSQL query statement below
select id,month,sum(salary) over(partition by id order by month range between 2 preceding and current row) Salary 
FROM Employee 
WHERE (id,month) NOT IN
(select id, max(month) from Employee  group by 1 )
order by id,month desc