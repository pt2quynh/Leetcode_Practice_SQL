with t1 as (
  select num, count(num) as freq
  from mynumbers
  group by 1
  having count(num) = 1
)
select max(num) as num
from t1