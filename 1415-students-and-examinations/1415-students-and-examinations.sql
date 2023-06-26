select x.student_id, x.student_name, x.subject_name, ifnull(e.num_sub, 0) as attended_exams 
from (
  select distinct s1.student_id, s1.student_name, s2.subject_name
  from students s1, subjects s2
) x
left join 
  (
    select student_id, subject_name, count(*) as num_sub
    from examinations
    group by 1, 2
    ) e 
  on x.student_id = e.student_id and x.subject_name = e.subject_name
order by x.student_id, x.subject_name
