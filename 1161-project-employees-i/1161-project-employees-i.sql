# Write your MySQL query statement below
with t1 as (
  select p.project_id, p.employee_id, e.name, e.experience_years
  from project p 
  join employee e on p.employee_id = e.employee_id
)

select project_id, round(sum(experience_years)/count(experience_years),2) as average_years
from t1
group by 1