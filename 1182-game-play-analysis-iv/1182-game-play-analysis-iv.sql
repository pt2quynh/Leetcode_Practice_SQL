with t1 as (
       select player_id, 
              min(event_date) as first_date
       from activity
       group by player_id
),
t2 as (
       select t1.player_id
       from t1
       join activity a on t1.player_id = a.player_id and datediff(a.event_date, t1.first_date) = 1
), 
t3 as (
       select count(1) as consecutive_player
       from t2
),
t4 as (
       select count(distinct player_id) as total_player
       from activity
)

select round(t3.consecutive_player/t4.total_player, 2) as fraction
from t3, t4