# Write your MySQL query statement below
select actor_id, director_id
from (
    select actor_id, director_id, count(1) as cooperate_count
    from actordirector
    group by 1, 2
    having count(1) >= 3
) sub_tb