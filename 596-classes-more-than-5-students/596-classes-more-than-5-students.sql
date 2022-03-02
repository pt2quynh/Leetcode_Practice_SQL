# Write your MySQL query statement below
select class
from (select class, count(student) from courses
     group by class
     having count(student) >= 5) as tb1