# Write your MySQL query statement below
select name, travelled_distance
from (
  select u.id, u.name, coalesce(sum(r.distance), 0) as travelled_distance
  from users u
  left join rides r on u.id = r.user_id
  group by 1, 2
) sub_tb
order by 2 desc, 1 asc