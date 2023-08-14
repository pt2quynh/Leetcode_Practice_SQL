with t1 as (
    select user_id, count(1) as count_rating 
    from movierating 
    group by 1
),
t2 as (
    select user_id
    from t1
    where count_rating = (select max(count_rating) from t1)
), 
t3 as (
    select name
    from users
    where user_id in (select user_id from t2)
    order by 1
    limit 1
),
t4 as (
    select movie_id, avg(rating) as avg_rating
    from movierating
    where extract(month from created_at) = '02' and extract(year from created_at) = '2020'
    group by 1
),
t5 as (
    select title
    from movies
    where movie_id in (select movie_id from t4 where avg_rating = (select max(avg_rating) from t4))
    order by 1
    limit 1
)

select name as results
from t3
union all
select title as results
from t5