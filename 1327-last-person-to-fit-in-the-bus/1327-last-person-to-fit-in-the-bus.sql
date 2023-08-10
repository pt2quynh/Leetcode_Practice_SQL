with t1 as (
        select turn, person_id, person_name,
                weight,
                sum(weight) over(order by turn) as total_weight
        from queue
)

select person_name
from t1
join (
        select max(total_weight) as max_weight
        from t1
        where total_weight <= 1000
) x on t1.total_weight = x.max_weight