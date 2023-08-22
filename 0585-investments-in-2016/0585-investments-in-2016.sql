with t1 as (
    select tiv_2015
    from (
        select tiv_2015, count(tiv_2015) as count_tiv
        from insurance
        group by 1
        having count(tiv_2015) > 1
    ) x
), 
t2 as (
    select *,
            count(1) over(partition by lat, lon) as count_row
    from insurance
)
,
t3 as (
    select *
    from t2
    where tiv_2015 in (select tiv_2015 from t1)
    and count_row = 1
)

select round(sum(tiv_2016), 2) as tiv_2016 
from t3
