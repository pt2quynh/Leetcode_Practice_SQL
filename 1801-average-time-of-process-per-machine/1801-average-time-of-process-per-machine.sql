# preferable
with t1 as (
  select a1.machine_id, a1.timestamp as start_time, a2.timestamp as end_time, a2.timestamp - a1.timestamp as diff
  from activity a1
  join activity a2
  on a1.machine_id = a2.machine_id
  and a1.process_id = a2.process_id
  and a1.timestamp < a2.timestamp
)
select machine_id, round(avg(diff),3) as processing_time
from t1
group by 1
# select a1.machine_id, a1.timestamp as start_time, a2.timestamp as end_time
# from activity a1, activity a2
# where a1.machine_id = a2.machine_id and a1.process_id = a2.process_id and a1.timestamp < a2.timestamp
