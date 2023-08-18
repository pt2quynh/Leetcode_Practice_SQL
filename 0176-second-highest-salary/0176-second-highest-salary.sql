with t1 as (
    select count(1) as count_row
    from employee
)

select 
    case when count_row = 1 then null
        else (
            select salary
            from (
                select id, salary,
                    dense_rank() over(order by salary desc) as rnk_sal
                from employee
            )x
            where rnk_sal = 2
            limit 1
        ) end as SecondHighestSalary 
from t1
