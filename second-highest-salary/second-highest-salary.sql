# Write your MySQL query statement below
/*
with rank_tb as
(
select id, salary,
        dense_rank() over(order by salary desc) as rank_sal
from employee)

select ifnull(
        (select distinct salary from rank_tb
        where rank_sal = 2), null
) as SecondHighestSalary 
*/

select ifnull (
    (select max(salary) as SecondHighestSalary from employee
    where salary not in (select max(salary) from employee)), null) as SecondHighestSalary