with t1 as (
        select distinct sell_date, product
        from activities
)

select sell_date,
        count(1) as num_sold,
        group_concat(product order by product asc) as products
from t1
group by 1
order by 1

