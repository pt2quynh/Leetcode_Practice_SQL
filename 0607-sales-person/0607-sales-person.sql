# Write your MySQL query statement below
select s.name
from salesperson s
where sales_id not in (
  select sales_id from (
    select com_id, sales_id
    from orders
    where com_id = (select com_id from company where name = 'RED')
  ) get_red_comp
)