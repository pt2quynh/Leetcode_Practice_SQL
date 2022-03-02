# Write your MySQL query statement below
select distinct tb2.id 
from weather tb1, weather tb2
where datediff(tb2.recordDate, tb1.recordDate) = 1
and tb2.temperature > tb1.temperature

