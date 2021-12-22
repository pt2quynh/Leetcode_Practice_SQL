with employee_info as (
    select e.name as e_name, 
            e.salary as e_sal, 
            d.name as d_department
    from employee e
    left join department d
        on e.departmentId = d.id),

ranksal_tb as (
    select *,
        dense_rank() over(partition by d_department order by e_sal desc) as denserank_sal
    from employee_info
)
    
select d_department as "Department",
        e_name as "Employee",
        e_sal as "Salary"
from ranksal_tb
where denserank_sal = 1


