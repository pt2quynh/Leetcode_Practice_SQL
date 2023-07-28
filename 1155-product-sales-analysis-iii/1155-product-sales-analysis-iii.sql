with t1 as (
    select product_id, year, quantity, price, 
            rank() over(partition by product_id order by year) as rno
    from sales
)

select product_id, year as first_year, quantity, price
from t1
where rno = 1
