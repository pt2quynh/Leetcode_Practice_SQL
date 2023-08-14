with t1 as (
  select id, student,
        coalesce(lead(student) over(), student) as lead_rnk
  from seat
),
t2 as (
    select id, student,
        lag(student) over() as lead_rnk
  from seat
)
select id, lead_rnk as student
from t1
where id % 2 != 0
union all
select id, lead_rnk as student
from t2
where id % 2 = 0
order by id