select class 
from (
    select class, count(student) 
    from courses
    group by 1
    having count(student) >= 5
) t1