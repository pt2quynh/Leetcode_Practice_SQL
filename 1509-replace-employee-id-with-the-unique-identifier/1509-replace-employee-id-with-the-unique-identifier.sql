# Write your MySQL query statement below
select ei.unique_id, e.name
from employees as e
left join employeeUNI as ei
on e.id = ei.id
