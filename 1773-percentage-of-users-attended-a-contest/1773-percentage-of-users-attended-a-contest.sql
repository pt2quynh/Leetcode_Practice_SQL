# Write your MySQL query statement below
with t1 as (
    select count(user_id) as total_user
    from (select distinct user_id from users) user_tb
),
t2 as(
    select distinct contest_id, count(user_id) as joined_user
    from register
    group by 1
)
,
t3 as (
    select t2.*, t1.*
    from t2, t1
)

select contest_id, round(joined_user/total_user*100, 2) as percentage 
from t3
order by percentage desc, contest_id 