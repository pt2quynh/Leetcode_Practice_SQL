# solution 1
# with t1 as (
#     select product_id, year, quantity, price, 
#             rank() over(partition by product_id order by year) as rnk
#     from sales
# )

# select product_id, year as first_year, quantity, price
# from t1
# where rnk = 1
# --------------------------------------------
# solution 2
with t1 as (
    select product_id, min(year) as first_year
    from sales
    group by 1
)

select s.product_id, s.year as first_year, s.quantity, s.price
from sales s
join t1 on s.product_id = t1.product_id and s.year = t1.first_year