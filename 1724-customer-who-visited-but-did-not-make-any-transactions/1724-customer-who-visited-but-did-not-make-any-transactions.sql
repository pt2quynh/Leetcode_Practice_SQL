# Write your MySQL query statement below
with tb1 as (
    select customer_id, visit_id
    from visits
    where visit_id not in (select visit_id from transactions)
)

select customer_id, count(visit_id) as count_no_trans
from tb1
group by 1
order by 2 desc