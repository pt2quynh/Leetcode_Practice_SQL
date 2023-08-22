with t1 as (
        select requester_id,
                count(1) as requester_count
        from requestaccepted
        group by 1
),

t2 as (
        select accepter_id,
                count(1) as accepter_count
        from requestaccepted
        group by 1
)
,
t3 as (
        select t1.requester_id as id, t1.requester_count as num from t1
        union all
        select t2.accepter_id as id, t2.accepter_count as num from t2
),

t4 as (
        select id, sum(num) as num
        from t3
        group by 1
)

select id, num
from t4
where num = (
        select max(num)
        from t4
)
