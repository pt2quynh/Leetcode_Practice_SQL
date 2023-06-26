# Write your MySQL query statement below
with t1 as (
    select c.user_id, c.action
    from confirmations c
    left join signups s on c.user_id = s.user_id
    union all
    select s.user_id, c.action
    from confirmations c
    right join signups s on s.user_id = c.user_id
)
# select * from t1
,
t2 as (
    select user_id,
        sum(case when action = 'timeout' then 1 else 0 end) as timeout,
        sum(case when action = 'confirmed' then 1 else 0 end) as confirmed,
        sum(1) as total
    from t1
    group by 1
)
select user_id, round(confirmed/total,2) as confirmation_rate
from t2
