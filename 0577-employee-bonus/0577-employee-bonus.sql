# Write your MySQL query statement below
#-----------------sol1-----------
# select e.name, b.bonus
# from employee e
# left join bonus b on e.empId = b.empId 
# where (b.bonus is null) or (b.bonus < 1000)
# -------------------------------
#sol2
select e.name, b.bonus
from employee e
left join bonus b
on e.empid = b.empid
where ifnull(b.bonus, 0) < 1000
