# Write your MySQL query statement below
# with t1 as (
#     SELECT player_id, 
#             event_date,
#             row_number() over(partition by player_id order by event_date) as ord
#     from Activity
# )

# select player_id,
#         event_date as first_login
# from t1
# where ord = 1

select distinct player_id, min(event_date) as first_login
from Activity
group by 1


# select distinct player_id, 
#         min(event_date) over(partition by player_id) as first_login
# from Activity 
