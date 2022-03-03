# Write your MySQL query statement below
with set_rank as (
    select *,
    id - dense_rank() over(order by id) as denserank
    from stadium
    where people >= 100
)

select id, visit_date, people from set_rank
where denserank in ( 
    select denserank 
    from set_rank
    group by denserank
    having count(denserank) >= 3
)
