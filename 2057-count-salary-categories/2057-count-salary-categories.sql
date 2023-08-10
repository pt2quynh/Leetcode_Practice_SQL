with t1 as (
        select 
                sum(case when income < 20000 then 1 else 0 end) as Low_Salary,
                sum(case when income between 20000 and 50000 then 1 else 0 end) as Average_Salary,
                sum(case when income > 50000 then 1 else 0 end) as High_Salary
        from accounts
)

select 'Low Salary' as category,  Low_Salary as accounts_count
from t1
union 
select 'Average Salary' as category, Average_Salary as accounts_count
from t1
union 
select 'High Salary' as category, High_Salary as accounts_count
from t1