with t1 as (
    select employee_id, name, age, reports_to
    from employees
    where reports_to is not null
),
t2 as (
    select reports_to, count(1) as reports_count, 
            round(avg(age), 0) as average_age
    from t1
    group by 1
)

select e.employee_id, e.name, t2.reports_count, t2.average_age
from employees e
join t2 on e.employee_id = t2.reports_to
order by e.employee_id