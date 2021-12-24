# Write your MySQL query statement below
with count_duplicate as (
    select id, email,
           dense_rank() over(partition by email order by id) as rank_email
    from person  
)

delete from person
where id in (
    select id 
    from count_duplicate
    where rank_email >= 2
)