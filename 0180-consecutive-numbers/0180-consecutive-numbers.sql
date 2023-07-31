with t1 as (
        select l1.id as l1_id, l1.num as l1_num,
        l2.id as l2_id, l2.num as l2_num,
        l3.id as l3_id, l3.num as l3_num
        from logs l1, logs l2, logs l3
        where l1.num = l2.num and l1.id + 1 = l2.id 
        and l2.num = l3.num and l2.id + 1 = l3.id
)

select distinct(l1_num) as ConsecutiveNums 
from t1
