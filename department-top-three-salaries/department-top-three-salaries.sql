# Write your MySQL query statement below
with denserank_tb as (
    select e.name as employee, e.salary as salary, d.name as department,
    dense_rank() over(partition by d.name order by e.salary desc) as rank_sal
    from employee e
    left join department d
    on e.departmentId = d.id
)

select department as "Department",
        employee as "Employee",
        salary as "Salary"
from denserank_tb
where rank_sal in (1, 2, 3)
