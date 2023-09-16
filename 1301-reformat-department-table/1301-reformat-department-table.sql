# Write your MySQL query statement below
with t1 as (
        select id, 
                sum(case when month = 'Jan' then revenue else null end) as Jan_Revenue,
                sum(case when month = 'Feb' then revenue else null end) as Feb_Revenue,
                sum(case when month = 'Mar' then revenue else null end) as Mar_Revenue,
                sum(case when month = 'Apr' then revenue else null end) as Apr_Revenue,
                sum(case when month = 'May' then revenue else null end) as May_Revenue,
                sum(case when month = 'Jun' then revenue else null end) as Jun_Revenue,
                sum(case when month = 'Jul' then revenue else null end) as Jul_Revenue,
                sum(case when month = 'Aug' then revenue else null end) as Aug_Revenue,
                sum(case when month = 'Sep' then revenue else null end) as Sep_Revenue,
                sum(case when month = 'Oct' then revenue else null end) as Oct_Revenue,
                sum(case when month = 'Nov' then revenue else null end) as Nov_Revenue,
                sum(case when month = 'Dec' then revenue else null end) as Dec_Revenue
        from department
        group by month, id
        order by id
)

select id, max(Jan_Revenue) as Jan_Revenue,
        max(Feb_Revenue) as Feb_Revenue,
        max(Mar_Revenue) as Mar_Revenue,
        max(Apr_Revenue) as Apr_Revenue,
        max(May_Revenue) as May_Revenue,
        max(Jun_Revenue) as Jun_Revenue,
        max(Jul_Revenue) as Jul_Revenue,
        max(Aug_Revenue) as Aug_Revenue,
        max(Sep_Revenue) as Sep_Revenue,
        max(Oct_Revenue) as Oct_Revenue,
        max(Nov_Revenue) as Nov_Revenue,
        max(Dec_Revenue) as Dec_Revenue
from t1
group by id