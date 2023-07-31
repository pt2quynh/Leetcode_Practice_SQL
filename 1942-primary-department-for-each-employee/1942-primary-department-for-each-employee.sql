with t1 as (
        select employee_id, 
                department_id,
                primary_flag,
                count(1) over(partition by employee_id) as count_flag
        from employee
)
select employee_id, department_id
from t1
where primary_flag = 'Y' or (primary_flag = 'N' and count_flag = 1)