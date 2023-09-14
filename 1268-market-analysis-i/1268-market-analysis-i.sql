# Write your MySQL query statement below
select u.user_id as buyer_id,
      u.join_date, 
      coalesce(sub_tb.buy_count, 0) as orders_in_2019
from users u
left join (
  select buyer_id, count(1) as buy_count
  from orders
  where extract(year from order_date) = '2019' 
  group by 1) sub_tb
on u.user_id = sub_tb.buyer_id

