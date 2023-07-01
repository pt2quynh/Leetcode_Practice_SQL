# # Write your MySQL query statement below
with t1 as (
        select query_name, sum(rating/position) as quality_sum,
                count(1) as num
        from queries
        group by 1 
),
t2 as (
        select query_name, sum(rating_cat) as poor
        from(
                 select query_name,
                        case when rating < 3 then 1 else 0 end as rating_cat
                 from queries
                
        )t1
        group by query_name
)
,
t3 as (
        select t1.*, t2.poor
        from t1 join t2 on t1.query_name = t2.query_name
)


select t3.query_name, round(t3.quality_sum/t3.num, 2) as quality,
        round(t3.poor/t3.num * 100, 2) as poor_query_percentage
from t3
group by 1
